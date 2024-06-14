#!/bin/bash

# Use vim if present
command -v vim >/dev/null && alias \
	vi="vim" vidiff="vim -d"

# Use neovim over vim if present
command -v nvim >/dev/null && alias \
	vi="nvim" vidiff="nvim -d"

# Verbosity and settings that we are most likely to want anyway.
alias \
	mkdir="mkdir -p" \
	ll="ls -l" \
	la="ls -la" \
	..="cd .." \
	df="df -h" \
	du="du -ch"

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


