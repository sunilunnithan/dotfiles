# Dotfiles

Personal development environment for macOS and Ubuntu, managed with [GNU Stow](https://www.gnu.org/software/stow/).

**Theme:** Catppuccin Mocha across all tools · **Font:** Fira Code 18pt · **Shell:** Zsh + Zinit · **Editor:** Neovim (LazyVim)

---

## Quick Start

```sh
git clone git@github.com:sunilunnithan/dotfiles.git ~/dotfiles
cd ~/dotfiles

# macOS
./mac-setup.sh   # installs Homebrew + all packages from Brewfile
./setup          # symlinks configs via stow

# Ubuntu
make ubuntu      # installs all packages + symlinks configs

# Omarchy (Arch + Hyprland)
make omarchy     # only symlinks configs; Omarchy already provisions the rest
```

### Stow management

Each subdirectory mirrors `$HOME`. Stow creates symlinks from `~` into the repo:

```sh
stow -t ~ zsh          # symlink zsh config
stow -D -t ~ zsh       # remove zsh symlinks
stow -R -t ~ nvim      # restow nvim config
```

Default stowed folders: `zsh nvim bin tmux git config zed herdr aerospace agents`

### Agent skills

`agents/.agents/skills` holds custom skills shared across AI coding agents. It
lives at `~/.agents/skills`, and each agent that supports skills should point
at it — e.g. Claude Code's `~/.claude/skills` is itself a symlink to
`~/.agents/skills`, so a skill added here shows up in every agent without
duplication.

### Optional: secrets & SSH via Ansible

```sh
git clone git@github.com:sunilunnithan/setup.git setup
cd setup
ansible-playbook --ask-vault-password --tags "ssh,secrets" local.yml -v
```

### Nix (any machine with Nix installed)

```sh
./nix-setup.sh   # auto-skips if nix is not present
# or
make nix
```

Installs the `myPackages` bundle defined in `config/.config/nixpkgs/config.nix`. The bundle covers all key CLI tools from the Brewfile that have Nix equivalents. The `setup` script also calls this automatically after stowing.

### Omakub (Ubuntu extras)

```sh
./run-omakub
```

---

## Zsh (`zsh/.zshrc`)

Plugin manager: **[Zinit](https://github.com/zdharma-continuum/zinit)** (auto-installed on first shell launch).

### Plugins

| Plugin | Purpose |
|---|---|
| `zsh-syntax-highlighting` | Live command syntax colouring |
| `zsh-autosuggestions` | Fish-style inline history suggestions |
| `zsh-completions` | Extra completion definitions |
| `fzf-tab` | Replace zsh completion menu with fzf |
| OMZ snippets | `git`, `sudo`, `aws`, `kubectl`, `kubectx`, `command-not-found` |

### Key bindings

| Key | Action |
|---|---|
| `Ctrl-F` | Launch `tmux-sessionizer` |
| `Ctrl-P` / `Ctrl-N` | History search backward / forward |
| `Ctrl-[W]` | Kill region |

### Aliases (selection)

| Alias | Expands to |
|---|---|
| `v`, `nv` | `nvim` |
| `g` | `git` |
| `lg` | `lazygit` |
| `ld` | `lazydocker` |
| `cat` | `bat --pager=never --style=plain` |
| `ls` | `ls --color --group-directories-first` |
| `ll` / `la` | `ls -l` / `ls -la` |
| `..` | `cd ..` (up to `cd..5` for 5 levels) |
| `h` | `history \| fzf` |
| `fa` | `alias \| fzf` |
| `fcbr` | Fuzzy checkout recent git branch |
| `ftldr` | Fuzzy search tldr pages |
| `tma` / `tmls` / `tmkill` | tmux attach / list / kill session |
| `gs` / `gp` | `git status` / `git pull` |
| `sbg` | Live grep Obsidian vault (`~/sb`) |
| `temp` | `cd` into a fresh `mktemp -d` |
| `weather` | `curl wttr.in` |

### FZF functions (`zsh/.fzf_function.zsh`)

| Function | Description |
|---|---|
| `fjq <file>` | Interactive `jq` filter with live preview |
| `fzf-man` | Browse man pages with fzf preview |
| `fzf-find-files` | Multi-select files, open in `$EDITOR` |
| `fzf-cd` | Navigate to directory with fzf |
| `fzf-cd-incl-hidden` | Same, including hidden directories |
| `fzf-cd-to-file` | `cd` into the directory of a selected file |
| `fzf-cd-to-parent` | Fuzzy-select a parent directory |
| `fzf-env-vars` | Search and print environment variables |
| `fzf-kill-processes` | Multi-select processes to kill |
| `fzf-git-status` | Git status with diff preview; opens selected files |
| `fzf-checkout` | Checkout existing branch or create new one |
| `fzf-aliases-functions` | Search and execute any alias or function |
| `fzf-eval` | Evaluate an ad-hoc command with live preview |
| `fzf-awesome-list` | Browse and run all `fzf-*` functions |

---

## Tmux (`tmux/.tmux.conf`)

Prefix: **`Ctrl-A`**

### Session & window management

| Key | Action |
|---|---|
| `prefix f` | `tmux-sessionizer` (fuzzy project picker) |
| `prefix K` | `sesh` session picker (fzf popup) |
| `prefix g` | New window running `lazygit` |
| `prefix H` | New window running `btop` |
| `prefix N` | Split right, open Obsidian vault in nvim |
| `prefix c` | New window (inherits cwd) |
| `prefix r` | Reload `~/.tmux.conf` |
| `prefix L` | Switch to last client |
| `prefix C` | Switch to `copilot` session |

### Pane management

| Key | Action |
|---|---|
| `prefix -` / `prefix _` | Split horizontal |
| `prefix \|` / `prefix \` | Split vertical |
| `prefix h/j/k/l` | Navigate panes (vim-style) |
| `Shift-Arrow` | Resize pane |
| `prefix b` | Break pane into new window |
| `prefix y` | Toggle pane synchronisation |
| `prefix e` | Capture pane output into nvim buffer |

### Plugins

| Plugin | Bind | Purpose |
|---|---|---|
| `vim-tmux-navigator` | `Ctrl-h/j/k/l` | Seamless nvim ↔ tmux pane navigation |
| `t-smart-tmux-session-manager` | `T` | Smart session management |
| `tmux-fzf-url` | `u` | Open URLs from scrollback |
| `extrakto` | `Tab` | Extract text/paths from scrollback |
| `tmux-floax` | `p` | Floating scratch pane |
| `tmux-fuzzback` | `/` | Fuzzy search scrollback |
| `tmux-yank` | | Clipboard yank integration |
| `tmux2k` | | Status bar (icons-only mode) |

**Status bar** at top · Blue pane borders · 1M line history · Mouse enabled

---

## Neovim (`nvim/.config/nvim/`)

Built on **[LazyVim](https://www.lazyvim.org/)**. Theme: Catppuccin. Plugin versions locked in `lazy-lock.json`.

Update plugins: `:LazyUpdate`

### Custom keymaps (`lua/config/keymaps.lua`)

| Key | Mode | Action |
|---|---|---|
| `n` / `N` | Normal | Search next/prev, keep cursor centred |
| `Ctrl-D` / `Ctrl-U` | Normal | Half-page scroll, keep cursor centred |
| `J` / `K` | Visual | Move selected lines down / up |
| `jj` / `jk` | Insert | Escape to normal mode |
| `jk` | Terminal | Exit terminal mode |
| `==` | Normal | Select all (`ggVG`) |
| `<leader>p` | Visual | Paste without overwriting register |
| `p` | Visual | Paste over selection without yanking |
| `<leader>d` | Normal/Visual | Delete to black hole register |
| `<leader>y` / `<leader>Y` | Visual/Normal | Yank to system clipboard |
| `<leader>cn` / `<leader>cp` | Normal | Copy file name / full path to clipboard |
| `<leader>X` | Normal | `chmod +x` current file |
| `<leader>sO` | Normal | Source current file |
| `<leader>sx` | Normal/Visual | Execute current/selected line as Lua |
| `<leader>sN` | Normal | Live grep personal notes |
| `<leader>go` | Normal | Open Octo (GitHub integration) |
| `@` | Visual | Run macro over visual region |

#### VimTmuxRunner (`<leader>v*`)

| Key | Action |
|---|---|
| `<leader>vo` | Open runner pane |
| `<leader>vf` | Focus runner pane |
| `<leader>va` | Attach to existing pane |
| `<leader>vl` | Send line(s) to runner |
| `<leader>vv` / `;v` | Send command to runner |
| `<leader>v-` / `<leader>v\|` | Open pane (bottom / right) |
| `<leader>vk` | Kill runner pane |

### Plugins (`lua/plugins/`)

| File | Plugin |
|---|---|
| `ui.lua` | UI overrides (Catppuccin, etc.) |
| `oil.lua` | [oil.nvim](https://github.com/stevearc/oil.nvim) — file manager |
| `tmux.lua` | Tmux integration |
| `obsidian.lua` | [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) — vault at `~/sb` |
| `diffview.lua` | [diffview.nvim](https://github.com/sindrets/diffview.nvim) — git diff UI |

---

## Git (`git/.gitconfig`)

Pager: **[delta](https://github.com/dandavison/delta)** with line numbers and decorations.  
Interactive rebase editor: **[interactive-rebase-tool](https://gitrebase.app/)**.

### Alias categories

| Category | Examples |
|---|---|
| Stage | `g a` (add all), `g ai` (interactive) |
| Commit | `g cm` (message), `g cam` (add+message), `g cd` (amend) |
| Branch | `g b`, `g ba` (all), `g bd`/`g bdd` (delete/force), `g bc` (current name) |
| Checkout | `g o` (checkout), `g om` (main), `g ob` (branch) |
| Diff | `g d`, `g dc` (cached), `g dp` (patience) |
| Log | `g l`, `g la` (all), `g ll` (graph), `g lc` (count) |
| Push/Pull | `g ps` (push), `g pl` (pull), `g pb` (push branch) |
| Rebase | `g rb`, `g rbi` (interactive), `g rba`/`g rbs` (abort/skip) |
| Stash | `g ss` (save), `g sl` (list), `g sp` (pop), `g sd` (drop) |
| Clone | `g clg` (github), `g clgp` (git@github), `g clgu` (own repo) |
| Cherry-pick | `g cp`, `g cpa` (abort), `g cpc` (continue) |
| Utility | `g aliases`, `g whois`, `g serve`, `g merged`, `g bump`, `g release` |

---

## Ghostty (`config/.config/ghostty/`)

| Setting | Value |
|---|---|
| Font | Fira Code 18pt, ligatures enabled |
| Theme | Catppuccin Mocha |
| Cursor | Inverted fg/bg |
| Copy on select | Clipboard |
| Shell integration | cursor, sudo, no-title |

### Key bindings

| Key | Action |
|---|---|
| `Ctrl-H/J/K/L` | Navigate splits |
| `Ctrl-Shift-Enter` | New split (auto direction) |
| `Ctrl-Shift-T` | New tab |
| `Ctrl-Shift-H/L` | Previous / next tab |
| `Ctrl-Shift-,/.` | Move tab left / right |
| `Ctrl-Shift-1…9` | Jump to tab N |
| `Ctrl-Shift-W` | Close surface |
| `Ctrl-Shift-M` | Toggle split zoom |
| `Ctrl-Shift-C/V` | Copy / paste |
| `Ctrl-Shift-S` | Save screen to file and open |
| `Ctrl-Shift-R` | Reload config |
| `Ctrl-Shift-I` | Toggle inspector |

Platform-specific config loaded from `mac` or `linux` (optional files, sourced automatically).

---

## Homebrew (`Brewfile`)

Shared between macOS and Ubuntu (`mac-setup.sh` and `ubuntu-setup.sh` both run `brew bundle` against it, the latter via Linuxbrew). macOS-only entries — casks, GUI apps, `borders` — are wrapped in `if OS.mac?` so the same file works on both.

Run `brew bundle` to install everything. Key packages by category:

| Category | Tools |
|---|---|
| Essentials | `git`, `neovim`, `tmux` |
| Modern CLI | `bat`, `delta`, `eza`, `fd`, `fzf`, `jq`, `ripgrep`, `sd`, `zoxide`, `starship` |
| Monitoring | `btop`, `ncdu` |
| Dev TUIs | `gh`, `lazygit`, `lazydocker`, `sesh` |
| Languages | `go`, `lua`, `node`, `nvm`, `python`, `rust`, `gcc`, `openjdk` |
| DevOps | `ansible`, `awscli`, `docker` |
| macOS extras | `raycast`, `espanso`, `alt-tab`, `maccy`, `stats` |
| Fonts | Fira Code, MesloLGS Nerd Font |

---

## Design Principles

- **VI keybindings everywhere** — zsh (`set -o vi`), tmux (copy mode), neovim, ghostty splits
- **FZF-centric workflows** — shell history, file navigation, git, man pages, processes all go through fzf
- **Lazy loading** — Zinit defers plugin load; lazy.nvim defers plugin load; `_source_if` guards optional files
- **Modern CLI replacements** — `bat` over `cat`, `eza`/`ls` with colour, `fd` over `find`, `ripgrep` over `grep`, `delta` over `diff`, `zoxide` over `cd`
- **Consistent theme** — Catppuccin Mocha in Neovim, Ghostty, tmux status bar
