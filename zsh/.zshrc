# utility functions 
_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }


if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# vi mode
set -o vi

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey -s ^f "tmux-sessionizer\n"

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first
set +o histexpand
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Return time on long running processes
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

_source_if ~/.secrets
_source_if ~/.functions.sh
_source_if ~/.fzf_function.bash
_source_if ~/.fzf_function.zsh
_source_if ~/.modules
_source_if ~/.src_tokens


# Aliases
_source_if ~/.bash_aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias d="date +%F"
alias g="git"
alias h="history"
alias s="source"
alias lg=lazygit
alias ld=lazydocker
alias gs="git status"
alias gp="git pull"
alias fb="fzf --height 40% --border"
alias fo="cat /tmp/out.txt | fb"
alias lvim="NM_APPNAME='lazyvim' nvim"


# Use vim if present
command -v vim >/dev/null && alias \
  vi="vim" vidiff="vim -d"

# Use neovim over vim if present
command -v nvim >/dev/null && alias \
  vi="nvim" vidiff="nvim -d" nv=nvim v=nvim kv='NVIM_APPNAME="kickstart" nvim'

# Verbosity and settings that we are most likely to want anyway.
alias \
  mkdir="mkdir -p" \
  ll="ls -l" \
  la="ls -la" \
  ..="cd .." \
  df="df -h" \
  du="du -ch"

alias cd..='cd ..'
alias cd..2='cd ../..'
alias cd..3='cd ../../..'
alias cd..4='cd ../../../..'
alias cd..5='cd ../../../../..'


# Colorize commands when possible (OSX)
ls -GFHh >/dev/null 2>&1 && alias \
  ls="ls -GFHh" \
  grep="grep --color=auto"

# Colorize commands when possible (Linux/BSD).
ls -hN --color=auto >/dev/null 2>&1 && alias \
  ls="ls -hN --color=auto --group-directories-first" \
  grep="grep --color=auto" \
  diff="diff --color=auto"

# Use lsd instead of ls when possible
lsd >/dev/null 2>&1 && alias \
  ls="lsd --date='+%Y-%m-%d %H:%M' --group-directories-first --literal" \
  tree="lsd --tree"

# Use eza instead of ls when possible
eza >/dev/null 2>&1 && alias \
  ls="eza --icons --time-style=long-iso -g --group-directories-first" \
  tree="eza --tree"

# Use bat instead of cat if possible
bat --version >/dev/null 2>&1 && alias \
  cat="bat --pager=never --style=plain"

# pip upgrade all packages
alias pip-outdated='pip list --outdated --format=freeze'
alias pip-upgrade="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"

# https://github.com/chubin/wttr.in
alias weather='curl http://wttr.in'

# crypto coin tracker
alias coin='curl rate.sx'

# custom programs
alias what-term="ps -p$PPID"
alias what-shell="ps -p $$"
alias open-ports="netstat -tulpn"

# Matrix
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

alias sortnr='sort -n -r'
alias repos='cd ~/repos/'
alias h='history | fzf'

#tmux
alias tmux='tmux -u'
alias tmls='tmux ls'
alias tma='tmux attach-session -t '
alias tmkill='tmux kill-session -t '
alias tmsend='tmux send-key -t '

# fzf
alias fa='alias | fzf'
alias fh='history | fzf'
alias fcbr='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} " --pointer="" | xargs git checkout'
alias ftldr='tldr --list | fzf --preview "tldr {1} " --preview-window=right,70% | xargs tldr'


alias '?'=duck
alias '??'=gpt
alias '???'=google
alias free='free -h'
alias chmox='chmod +x'
alias diff='diff --color'
alias sshh='sshpass -f $HOME/.sshpass ssh '
alias temp='cd $(mktemp -d)'
alias view='vi -R' # which is usually linked to vim
alias more="less"
alias python="python3"


_have gh && . <(gh completion -s zsh)
_have fzf && . <(fzf --zsh)
_have z && . <(z completion zsh)
_have glow && . <(glow completion zsh)
_have goreleaser && . <(goreleaser completion zsh 2>/dev/null)
_have klogin && . <(klogin completion zsh 2>/dev/null)
_have kubectl && . <(kubectl completion zsh 2>/dev/null)
_have k && complete -o default -F __start_kubectl k
_have istioctl && . <(istioctl completion zsh 2>/dev/null)
_have kind && . <(kind completion zsh)
_have cobra && . <(cobra completion zsh)
_have kompose && . <(kompose completion zsh)
_have helm && . <(helm completion zsh)
_have devpod && source <(devpod completion zsh)
_have conftest && . <(conftest completion zsh)
_have mk && complete -o default -F __start_minikube mk
_have podman && _source_if "$HOME/.local/share/podman/completion" 
_have docker && _source_if "$HOME/.local/share/docker/completion" 
_have docker-compose && complete -F _docker_compose dc            

_have terraform && complete -C terraform terraform
_have terraform && complete -C terraform tf
_have starship && eval "$(starship init zsh)"
_have zoxide && eval "$(zoxide init --cmd cd zsh)"

# Do OS dependant stuff
case `uname` in
  Darwin)
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    export BREWHOME="/opt/homebrew"
    export BREWCOMPT="$BREWHOME/share/zsh/site-functions"
    export PATH=/Volumes/Samsung/Homebrew/bin:$PATH
    export HOMEBREW_PREFIX=/Volumes/Samsung/Homebrew
    export HOMEBREW_CELLAR=/Volumes/Samsung/Homebrew/Cellar
    export HOMEBREW_REPOSITORY=/Volumes/Samsung/Homebrew


    _have podman && _source_if "$BREWCOMPT/_podman" 
    _have tldr && _source_if "$BREWCOMPT/_tldr" 
    _have alacritty && _source_if "$BREWCOMPT/_alacritty" 
    _have aws && _source_if "$BREWCOMPT/_aws" 
    _have gum && _source_if "$BREWCOMPT/_gum" 
    _have hyperfine && _source_if "$BREWCOMPT/_hyperfine" 
    _have zoxide && _source_if "$BREWCOMPT/_zoxide" 
  ;;
  Linux)
    # Commands for Linux go here

    if [ -f /etc/lsb-release ]; then
      zinit snippet OMZP::ubuntu
    fi
  ;;
esac


if type fd > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

export FZF_DEFAULT_OPTS='--reverse --bind 'ctrl-l:cancel''
export FZF_TMUX_HEIGHT=80%

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


export PATH="$HOME/.rd/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

