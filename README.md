# Dotfiles

## Components

- Zsh Configuration
  - [Antizen](https://github.com/zsh-users/antigen) - Plugin Manager
  - [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - Zsh config framework
  - [asdf](https://github.com/asdf-vm/asdf) - Multi-language version manager
  - [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [neovim](https://github.com/neovim/neovim)
- [Omakub](https://github.com/sunilunnithan/omakub)

### Installation

```sh
git clone git@github.com:sunilunnithan/dotfiles.git dotfiles --recursive
cd dotfiles && ./setup
```

### Omakub Setup

Run Omakub setup script under dotfiles folder

```sh
./run-omakub
```

### Optional - Run Ansible Playbook to setup the ssh and secrets folder

```sh
git clone git@github.com:sunilunnithan/setup.git dotfiles --recursive
cd setup
ansible-playbook --ask-vault-password --tags "ssh,secrets" local.yml -v
```
