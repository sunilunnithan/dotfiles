#!/bin/bash

set -e

DOTFILES="${DOTFILES:-$HOME/dotfiles}"

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Apple Silicon uses /opt/homebrew, Intel uses /usr/local
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

echo "Installing packages from Brewfile..."
brew bundle --file "$DOTFILES/Brewfile"
