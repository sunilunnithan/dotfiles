#!/usr/bin/env bash
# shellcheck disable=SC1090
# ---------------------- local utility functions ---------------------

case $- in
*i*) ;; # interactive
*) return ;;
esac

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ----------------------
#                           (also see envx)

export LANG=en_US.UTF-8 # assuming apt install language-pack-en done
export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export FTP=242
export REPOS="$HOME/repos"
export DOTFILES="$HOME/dotfiles"
export HELP_BROWSER=lynx
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export TEMPLATES="$HOME/Templates"
export TERM=xterm-256color
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
#export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0
export LC_COLLATE=C
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
	if [[ -r "$HOME/.dircolors" ]]; then
		eval "$(dircolors -b "$HOME/.dircolors")"
	else
		eval "$(dircolors -b)"
	fi
fi

# ------------------------------- path -------------------------------

pathappend() {
	declare arg
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="${PATH:+"$PATH:"}$arg"
	done
} && export -f pathappend

pathprepend() {
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

# remember last arg will be first in path
pathprepend \
	"$HOME/.local/bin" \
	"$HOME/.local/go/bin" \
	/usr/local/go/bin \
	/usr/local/opt/openjdk/bin \
	/usr/local/bin

pathappend \
	/usr/local/opt/coreutils/libexec/gnubin \
	'/mnt/c/Windows' \
	/mingw64/bin \
	/usr/local/bin \
	/usr/local/sbin \
	/usr/local/games \
	/usr/games \
	/usr/sbin \
	/usr/bin \
	/snap/bin \
	/sbin \
	/bin

# ------------------------ bash shell options ------------------------

# shopt is for BASHOPTS, set is for SHELLOPTS

shopt -s checkwinsize # enables $COLUMNS and $ROWS
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

#shopt -s nullglob # bug kills completion for some
#set -o noclobber

# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
	local P='$' dir="${PWD##*/}" B countme short long double \
		r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
		u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
		b='\[\e[36m\]' x='\[\e[0m\]'

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.
	countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="$g($b$B$g)"

	short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
	long="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$g╚ $p$P$x "
	double="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "

	if ((${#countme} > PROMPT_MAX)); then
		PS1="$double"
	elif ((${#countme} > PROMPT_LONG)); then
		PS1="$long"
	else
		PS1="$short"
	fi
}

PROMPT_COMMAND="__ps1"

# -------------------------- stty annoyances -------------------------

#stty stop undef # disable control-s accidental terminal stops
stty -ixon # disable control-s/control-q tty flow control

# ------------------------------ history -----------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

alias ip='ip -c'
alias '?'=duck
alias '??'=gpt
alias '???'=google
alias dot='cd $DOTFILES'
alias ls='ls -h --color=auto'
alias free='free -h'
alias chmox='chmod +x'
alias diff='diff --color'
alias sshh='sshpass -f $HOME/.sshpass ssh '
alias temp='cd $(mktemp -d)'
alias view='vi -R' # which is usually linked to vim
alias more="less"

_have gh && . <(gh completion -s bash)
_have vim && alias vi=vim
_have z && . <(z completion bash)
_have glow && . <(glow completion bash)
_have goreleaser && . <(goreleaser completion bash 2>/dev/null)
_have klogin && . <(klogin completion bash 2>/dev/null)
_have pandoc && . <(pandoc --bash-completion)
_have kubectl && . <(kubectl completion bash 2>/dev/null)
_have k && complete -o default -F __start_kubectl k
_have istioctl && . <(istioctl completion bash 2>/dev/null)
_have kind && . <(kind completion bash)
_have cobra && . <(cobra completion bash)
_have kompose && . <(kompose completion bash)
_have helm && . <(helm completion bash)
# _have minikube && . <(minikube completion bash)
_have conftest && . <(conftest completion bash)
_have mk && complete -o default -F __start_minikube mk
_have podman && _source_if "$HOME/.local/share/podman/completion" # d
_have docker && _source_if "$HOME/.local/share/docker/completion" # d
_have docker-compose && complete -F _docker_compose dc            # dc

_have terraform && complete -C /usr/bin/terraform terraform
_have terraform && complete -C /usr/bin/terraform tf
