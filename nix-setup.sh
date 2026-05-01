#!/usr/bin/env bash

set -e

if ! command -v nix-env &>/dev/null; then
  echo "Nix is not installed on this machine. Skipping."
  exit 0
fi

echo "Nix detected: $(nix-env --version)"

# Ensure the nixpkgs config is stowed so nix-env can find myPackages
DOTFILES="${DOTFILES:-$HOME/dotfiles}"
if [ ! -f "$HOME/.config/nixpkgs/config.nix" ]; then
  echo "Stowing nixpkgs config..."
  pushd "$DOTFILES" >/dev/null
  stow -t ~ config
  popd >/dev/null
fi

echo "Installing packages via nix-env..."
nix-env -iA nixpkgs.myPackages

echo "Done. You may need to restart your shell for PATH changes to take effect."
