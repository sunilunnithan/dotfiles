# .zshrc
export DOTFILES="$HOME/dotfiles"
export GPG_TTY=$TTY

# use 256 color terminal
# export TERM=xterm-256color

# use vim as standard editor
export VISUAL=vim
export EDITOR="$VISUAL"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $DOTFILES/zsh/antigen/antigen.zsh # Load Antigen


if [ -f $HOME/.modules ]; then
	source $HOME/.modules
fi

if [ -f $HOME/.bash_aliases ]; then
	source $HOME/.bash_aliases
fi
# Use oh-my-zsh
antigen use oh-my-zsh

# Plugin

#shell
antigen bundle git
antigen bundle git-prompt
antigen bundle gitignore
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh_reload
antigen bundle z
antigen bundle command-not-found
# antigen bundle common-aliases
antigen bundle colored-man-pages
antigen bundle encode64
antigen bundle extract
antigen bundle fzf
antigen bundle genpass
antigen bundle rsync
antigen bundle systemadmin
antigen bundle systemd
antigen bundle djui/alias-tips
antigen bundle lukechilds/zsh-nvm
antigen bundle fd
antigen bundle copydir
antigen bundle copyfile
antigen bundle encode64
antigen bundle last-working-dir
antigen bundle web-search
antigen bundle safe-paste
antigen bundle copybuffer
antigen bundle vi-mode
antigen bundle dirhistory






#jvm
antigen bundle gradle
antigen bundle scala
antigen bundle sbt
antigen bundle spring
antigen bundle jfrog
antigen bundle mvn


# docker/kube
antigen bundle kubernetes
antigen bundle kubectl
antigen bundle oc
antigen bundle kube-ps1
antigen bundle docker
antigen bundle docker-compose
antigen bundle docker-machine
antigen bundle helm

# dotnet
antigen bundle dotnet


# Python/Web
antigen bundle pip 
antigen bundle python
antigen bundle httpie
antigen bundle jsontools
antigen bundle ng
antigen bundle pep8
antigen bundle pipenv
antigen bundle pylint
antigen bundle urltools



#network
antigen bundle nmap


# Node stuff
antigen bundle node
antigen bundle npm
antigen bundle yarn

# golang
antigen bundle golang

#misc
antigen bundle redis-cli
antigen bundle terraform
antigen bundle fuck
antigen bundle vagrant
antigen bundle ripgrep




# Do OS dependant stuff
case `uname` in
  Darwin)
    # Commands for OS X go here
    antigen bundle osx
    antigen bundle postgres

    source $DOTFILES/zsh/.zshrc-mac.zsh
  ;;
  Linux)
    # Commands for Linux go here

    if [ -f /etc/lsb-release ]; then
      antigen bundle ubuntu
    fi
  ;;
esac

# Set the theme
antigen theme robbyrussell

# And lastly, apply the Antigen stuff
antigen apply


# History Options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
set +o histexpand

# Share history across all your terminal windows
setopt share_history
#setopt noclobber

# set some more options
setopt pushd_ignore_dups
#setopt pushd_silent

# Increase history size
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Return time on long running processes
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Place to stash environment variables
if [[ -a ~/.secrets ]]
then
  source ~/.secrets
fi

# Load functions
for f in $DOTFILES/functions/*.sh; do source $f; done

# Load aliases
for f in $DOTFILES/aliases/*.aliases.*sh; do source $f; done

# Load all path files
for f in $DOTFILES/path/*.path.sh; do source $f; done

if type fd > /dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

export FZF_DEFAULT_OPTS='--reverse --bind 'ctrl-l:cancel''
export FZF_TMUX_HEIGHT=80%
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export BAT_THEME='Monokai Extended Bright'

export AWS_PAGER='bat -p'

# Needed for Crystal on mac - openss + pkg-config
if [ `uname` = Darwin ]; then
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig
fi

# bind key
bindkey -s ^f "tmux-sessionizer\n"
#eval "$(starship init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/sunilu/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
