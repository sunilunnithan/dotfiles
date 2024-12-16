antigen bundle osx

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

export BREWHOME="/opt/homebrew"
export BREWCOMPT="$BREWHOME/share/zsh/site-functions"
export PATH=/Volumes/Samsung/Homebrew/bin:$PATH
export HOMEBREW_PREFIX=/Volumes/Samsung/Homebrew
export HOMEBREW_CELLAR=/Volumes/Samsung/Homebrew/Cellar
export HOMEBREW_REPOSITORY=/Volumes/Samsung/Homebrew

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

_have podman && _source_if "$BREWCOMPT/_podman" 
_have tldr && _source_if "$BREWCOMPT/_tldr" 
_have alacritty && _source_if "$BREWCOMPT/_alacritty" 
_have aws && _source_if "$BREWCOMPT/_aws" 
_have gum && _source_if "$BREWCOMPT/_gum" 
_have hyperfine && _source_if "$BREWCOMPT/_hyperfine" 
_have zoxide && _source_if "$BREWCOMPT/_zoxide" 
