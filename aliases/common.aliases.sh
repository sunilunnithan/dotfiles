#!/bin/zsh

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

alias c=clear
alias lg=lazygit
alias ld=lazydocker

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

# ------------------------------ history -----------------------------
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

set -o vi

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
