#!/bin/bash

declare -a common_packages=(
	curl wget git git-delta zsh tmux bat fzf eza unzip neovim ripgrep ncdu ranger vim zoxide jq exa
)

install_mac() {
	brew tap homebrew/cask-fonts
	brew install "${common_packages[@]}" gh fd pastel iterm2 maccy stats tree wget markdown \
		koekeishiya/formulae/skhd koekeishiya/formulae/yabai font-fira-code-nerd-font hyperfine lf lsd \
		neofetch lazydocker awscli
}

install_mac
