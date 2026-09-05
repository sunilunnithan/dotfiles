#!/usr/bin/env bash

set -e
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

fancy_echo() {
  printf "\n%b\n" "$1"
}

. /etc/os-release
if [[ "$ID" != "ubuntu" ]]; then
  fancy_echo "Sorry! this script only supports Ubuntu."
  exit 1
fi

fancy_echo "Updating system packages ..."
if command -v aptitude >/dev/null; then
  fancy_echo "Using aptitude ..."
else
  fancy_echo "Installing aptitude ..."
  sudo apt-get install -y aptitude
fi

sudo aptitude update

fancy_echo "Installing essential build tools"
sudo aptitude install -y \
  build-essential xsel xclip unzip curl stow

fancy_echo "Installing vim ..."
sudo apt-get -y install vim

fancy_echo "Installing python ..."
sudo aptitude install -y python3

DOTFILES="${DOTFILES:-$HOME/dotfiles}"

# Install Homebrew (Linuxbrew) if not present
if ! command -v brew &>/dev/null; then
  fancy_echo "Installing Homebrew ..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# neovim, tmux, go, node, rust, lazygit, delta, fd, ripgrep, bat, fzf,
# gh, ansible, awscli, etc. all come from the shared Brewfile - this is
# the same list mac-setup.sh installs, minus anything gated `if OS.mac?`
fancy_echo "Installing packages from Brewfile ..."
brew bundle --file "$DOTFILES/Brewfile"

fancy_echo "Installing zsh ..."
sudo aptitude install -y zsh

fancy_echo "Setup dotfiles ..."
export DOTFILES
"$DOTFILES/setup"
