alias v=nvim
alias kv='NVIM_APPNAME="kickstart" nvim'
alias nv=nvim
alias vim='nvim'
alias ll='ls -lrt'
alias la='ls -lAFh'
alias c=clear
alias lg=lazygit
alias cat=bat
alias grep='grep --color'
alias sortnr='sort -n -r'
alias repos='cd ~/repos/'
alias h='history | fzf'
alias cd..='cd ..'
alias cd..2='cd ../..'
alias cd..3='cd ../../..'
alias cd..4='cd ../../../..'
alias cd..5='cd ../../../../..'
alias module='module 2>&1'
alias ml='module load'
alias grep='grep --color'
alias ncurl='curl --negotiate -u: '
alias tmux='tmux -u'
alias bat='bat --pager=never'



#tmux
alias tmls='tmux ls'
alias tma='tmux attach-session -t '
alias tmkill='tmux kill-session -t '
alias tmsend='tmux send-key -t '



# fzf
alias fal='alias | fzf'
alias fh='history | fzf'
alias fcbr='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} " --pointer="" | xargs git checkout'
alias ftldr='tldr --list | fzf --preview "tldr {1} " --preview-window=right,70% | xargs tldr'
