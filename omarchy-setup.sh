#!/usr/bin/env bash

# Omarchy already provisions the base system (Hyprland, neovim, tmux, zsh,
# terminal, fonts, and most CLI tooling) as part of its own install. This
# script does not try to replicate that — it only layers personal dotfiles
# on top via stow, same idea as ./setup on macOS after ./mac-setup.sh.
#
# For a plain (non-Omarchy) Ubuntu/Debian box that needs the full system
# bootstrap, use ./ubuntu-setup.sh instead.

set -e
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

fancy_echo() {
  printf "\n%b\n" "$1"
}

if [[ -z $DOTFILES ]]; then
  DOTFILES=$HOME/dotfiles
fi

if ! command -v stow >/dev/null; then
  fancy_echo "Installing stow ..."
  sudo pacman -S --needed --noconfirm stow
fi

# nvim is handled separately below: Omarchy already owns ~/.config/nvim
# (its own LazyVim install), so ours runs under NVIM_APPNAME=nvim-sunilu
# instead of overwriting it (see the Linux case in zsh/.zshrc).
if [[ -z $STOW_FOLDERS ]]; then
  STOW_FOLDERS="zsh,bin,tmux,git,config,herdr"
fi

fancy_echo "Stowing dotfiles ..."
pushd "$DOTFILES" || exit
for folder in $(echo "$STOW_FOLDERS" | sed "s/,/ /g"); do
  echo "stow $folder"
  stow -D "$folder"
  stow "$folder"
done

# VS Code's user config on Linux follows XDG convention (~/.config/Code/User),
# different from macOS, so it needs its own stow target
VSCODE_USER_DIR="$HOME/.config/Code/User"
if [ -d "$VSCODE_USER_DIR" ]; then
  echo "stow vscode -> $VSCODE_USER_DIR"
  stow -t "$VSCODE_USER_DIR" -D vscode
  stow -t "$VSCODE_USER_DIR" vscode
fi
popd || exit

fancy_echo "Linking nvim config to NVIM_APPNAME=nvim-sunilu ..."
mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES/nvim/.config/nvim" "$HOME/.config/nvim-sunilu"
