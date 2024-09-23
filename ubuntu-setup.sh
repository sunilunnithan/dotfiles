# Going to depend on github.com/sunilunnithan/omakub
fancy_echo() {
  printf "\n%b\n" "$1"
}

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="$2"

  if [[ -w "$HOME/.zshrc.local" ]]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if ((skip_new_line)); then
      printf "%s\n" "$text" >>"$zshrc"
    else
      printf "\n%s\n" "$text" >>"$zshrc"
    fi
  fi
}

check_program() {
  $1
  if echo $? == 0; then
    echo "$1 Everything Ok."
  else
    echo "Error with program installation $1"
  fi
}

### end common-components/shared-functions

#!/usr/bin/env bash
### end common-components/bash-shebang

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e
### end common-components/exit-trap

if ! grep -qiE 'jammy|wheezy|jessie|precise|trusty|xenial|bionic|focal|groovy' /etc/os-release; then
  fancy_echo "Sorry! we don't currently support that distro."
  exit 1
fi
### end linux-components/distro-check

fancy_echo "Updating system packages ..."
if command -v aptitude >/dev/null; then
  fancy_echo "Using aptitude ..."
else
  fancy_echo "Installing aptitude ..."
  sudo apt-get install -y aptitude
fi

sudo aptitude update
### end linux-components/debian-package-update

fancy_echo "Installing essential network & build tools"
sudo aptitude install -y build-essential software-properties-common network-manager libnss3-tools jq xsel libssl-dev net-tools apt-transport-https xclip unzip

fancy_echo "Installing libraries for common gem dependencies ..."
sudo aptitude install -y libxslt1-dev libcurl4-openssl-dev libksba8 libksba-dev libreadline-dev

fancy_echo "Installing Postgres, a good open source relational database ..."
sudo aptitude install -y postgresql postgresql-server-dev-all

fancy_echo "Install golang"
sudo aptitude install -y golang

fancy_echo "Installing Redis, a good key-value database ..."
sudo aptitude install -y redis-server redis

fancy_echo "Installing ctags, to index files for vim tab completion of methods, classes, variables ..."
sudo aptitude install -y exuberant-ctags

fancy_echo "Installing vim ..."
sudo aptitude install -y vim

fancy_echo "Installing nvim ..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get -y install neovim

fancy_echo "Installing tmux, to save project state and switch between projects ..."
sudo aptitude install -y tmux

fancy_echo "Installing watch, to execute a program periodically and show the output ..."
sudo aptitude install -y watch

fancy_echo "Installing fzf ..."
sudo aptitude install -y fzf

fancy_echo "Installing curl ..."
sudo aptitude install -y curl

fancy_echo "Install python utilities..."
sudo aptitude install -y python3
sudo aptitude install -y python3-distutils

fancy_echo "Install sqlite ..."
sudo apt install -y sqlite3

fancy_echo "Install pip"
sudo apt install python3-pip 'python3-venv'

fancy_echo "Installing pipx"
python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pip install --user -U pipx

fancy_echo "Install python tools using pipx"
# pipx install httpie  --force
# pipx install pgcli  --force
# pipx install glances --force

fancy_echo "Installing nodejs tools"
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g npm
sudo npm install -g yarn
sudo npm install -g tldr gtop

fancy_echo "Install Rust tools"
RUSTUP_INIT_SKIP_PATH_CHECK=yes curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env
rustup update stable
cargo install git-delta

fancy_echo "Installing modern unix toosl"
sudo aptitude install -y fd-find ripgrep htop colordiff bat

fancy_echo "Installing dotnet sdk & tools"
# sudo snap install dotnet-sdk --classic
# sudo snap install powershell --classic
# sudo dotnet tool install --global csharp-ls

fancy_echo "Install lazygit ..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

fancy_echo "install stow .."
sudo apt install -y stow

fancy_echo "Setup dotfiles ..."
stow zsh nvim bin tmux git

fancy_echo "Installing zsh & oh my zsh ..."
sudo aptitude install -y zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
