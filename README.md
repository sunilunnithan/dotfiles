# Dotfiles

## Components

- Zsh Configuration
  - [Antizen](https://github.com/zsh-users/antigen) - Plugin Manager
  - [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - Zsh config framework
  - [asdf](https://github.com/asdf-vm/asdf) - Multi-language version manager
  - [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [neovim](https://github.com/neovim/neovim) and [vim-plug](https://github.com/junegunn/vim-plug)

### Installation

```sh
git clone git@github.com:sunilunnithan/dotfiles.git dotfiles --recursive
cd dotfiles
stow bin git nvim tmux zsh
```

### Other Tasks

*[See Makefile](./Makefile)*
