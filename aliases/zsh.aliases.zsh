
_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

_have gh && . <(gh completion -s zsh)
_have fzf && . <(fzf --zsh)
_have z && . <(z completion zsh)
_have glow && . <(glow completion zsh)
_have goreleaser && . <(goreleaser completion zsh 2>/dev/null)
_have klogin && . <(klogin completion zsh 2>/dev/null)
_have pandoc && . <(pandoc --zsh-completion)
_have kubectl && . <(kubectl completion zsh 2>/dev/null)
_have k && complete -o default -F __start_kubectl k
_have istioctl && . <(istioctl completion zsh 2>/dev/null)
_have kind && . <(kind completion zsh)
_have cobra && . <(cobra completion zsh)
_have kompose && . <(kompose completion zsh)
_have helm && . <(helm completion zsh)
_have devpod && source <(devpod completion zsh)
# _have minikube && . <(minikube completion zsh)
_have conftest && . <(conftest completion zsh)
_have mk && complete -o default -F __start_minikube mk
_have podman && _source_if "$HOME/.local/share/podman/completion" # d
_have docker && _source_if "$HOME/.local/share/docker/completion" # d
_have docker-compose && complete -F _docker_compose dc            # dc

_have terraform && complete -C terraform terraform
_have terraform && complete -C terraform tf
_have starship && eval "$(starship init zsh)"
_have zoxide && eval "$(zoxide init --cmd cd zsh)"
