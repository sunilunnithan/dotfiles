# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup & Installation

This repo uses **GNU Stow** to symlink config folders into the home directory.

```bash
# Initial setup (installs deps, runs stow)
./setup

# macOS-specific setup (Homebrew packages)
./mac-setup.sh

# Ubuntu-specific setup
make ubuntu
# or: ./ubuntu-setup.sh
```

The `setup` script stows these folders by default: `zsh, nvim, bin, tmux, git, config`

To stow/restow a specific folder:
```bash
stow -t ~ zsh          # symlink zsh config
stow -D -t ~ zsh       # remove zsh symlinks
stow -R -t ~ nvim      # restow nvim config
```

## Repository Architecture

**Stow-managed config directories** (each mirrors the home directory structure):
- `zsh/` → `.zshrc`, `.fzf_function.zsh`
- `nvim/` → `.config/nvim/` (LazyVim-based Neovim config)
- `tmux/` → `.tmux.conf`
- `git/` → `.gitconfig`, `.gitignore`
- `config/` → `.config/ghostty/`, `.config/alacritty/`, `.config/nixpkgs/`
- `bin/` → `.local/bin/` and `.local/share/nvim/`

**Homebrew packages** are declared in `Brewfile` — add new packages there to keep the system reproducible.

## Neovim Config (`nvim/.config/nvim/`)

Built on **LazyVim**. Key structure:
- `lua/config/keymaps.lua` — custom keybindings
- `lua/config/options.lua` — editor options
- `lua/config/autocmds.lua` — auto commands
- `lua/plugins/` — plugin overrides (`oil.lua`, `tmux.lua`, `ui.lua`)
- `lua/utils/` — helper utilities (debug, profiler, cheatsheet)

Plugin versions are locked in `lazy-lock.json`. Update plugins with `:LazyUpdate` inside Neovim.

## Zsh Config (`zsh/.zshrc`)

Uses **Zinit** as the plugin manager. Key plugins: `zsh-syntax-highlighting`, `zsh-autosuggestions`, `fzf-tab`, plus oh-my-zsh snippets (git, sudo, aws, kubectl).

FZF utility functions live in `zsh/.fzf_function.zsh` (fjq, fzf-man, fzf-rm, etc.).

VI mode is enabled globally (`set -o vi`).

## Tmux Config (`tmux/.tmux.conf`)

Prefix is `Ctrl-A`. Notable bindings:
- `f` → tmux-sessionizer, `K` → sesh session picker (fzf)
- `g` → lazygit window, `H` → btop window
- `-` / `_` / `|` / `\` → split panes; `h/j/k/l` → navigate panes

Plugins are managed via **TPM** (Tmux Plugin Manager). Install with `prefix + I`.

## Git Config (`git/.gitconfig`)

Uses **delta** as the pager (with line numbers). Diff tool is vimdiff. Contains 100+ git aliases.

## Ghostty Config (`config/.config/ghostty/`)

Platform-specific includes: `config` sources `mac` or `linux` depending on OS. Theme is Catppuccin Mocha, font is Fira Code 18pt.

## Design Patterns

- **Consistent VI keybindings** across all tools (zsh, tmux, neovim, vscode, ghostty)
- **FZF-centric workflows** — fuzzy finding integrated into shell, tmux, and neovim
- **Lazy loading** — both zsh (conditional sourcing via `_source_if`) and neovim (lazy.nvim) defer loading
- **Modern CLI tool preferences** — ripgrep over grep, bat over cat, zoxide over cd, delta over diff
- **Cloud/DevOps ready** — PATH includes kubectl krew plugins, cargo, go, dotnet, rancher desktop
