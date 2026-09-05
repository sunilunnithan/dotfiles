#############################################################
# ~/.Brewfile - Software Installs for macOS and Linux       #
#############################################################
# Shared between mac-setup.sh and ubuntu-setup.sh (Homebrew
# runs on Linux too). Entries that only make sense on macOS
# (casks, GUI apps, macOS-only formulae) are wrapped in
# `if OS.mac?` so this one file works on both platforms.

# Options
cask_args require_sha: true

#############################################################
# Command Line                                              #
#############################################################

# Essentials
brew 'dash-shell'   # POSIX-compliant shell for portable script testing
brew 'git'          # Version control
brew 'neovim'       # Text editor
brew 'tmux'         # Terminal multiplexer

# Modern CLI tools
brew 'atuin'        # Shell history search and sync (better ctrl-r)
brew 'bat'          # Output highlighting (better cat)
brew 'broot'        # Fuzzy directory tree navigator
brew 'delta'        # Syntax-highlighting pager for git
brew 'diffnav'      # Delta-based git diff pager with a file tree
brew 'duf'          # Disk usage/free (better df)
brew 'fd'           # Fast file finder (better find)
brew 'fzf'          # Fuzzy file finder and filtering
brew 'glow'         # Markdown renderer for terminal
brew 'httpie'       # User-friendly HTTP client (better curl)
brew 'hyperfine'    # Benchmarking for arbitrary commands
brew 'jq'           # JSON parser, output and query files
brew 'just'         # Command runner (better make)
brew 'eza'          # Modern ls replacement
brew 'lf'           # Terminal file manager
brew 'llm'          # CLI for interacting with LLMs
brew 'pastel'       # Color manipulation tool
brew 'pet'          # Snippet manager
brew 'procs'        # Process viewer (better ps)
brew 'ripgrep'      # Searching within files (better grep)
brew 'sd'           # RegEx find and replace (better sed)
brew 'starship'     # Cross-shell prompt
brew 'tldr'         # Community-maintained docs (better man)
brew 'tree'         # Directory listings as tree structure
brew 'yq'           # YAML processor (jq for YAML)
brew 'zoxide'       # Auto-learning navigation (better cd)

# Monitoring
brew 'btop'         # Resource monitor (better htop)
brew 'ncdu'         # Disk usage analyzer (better du)

# Development TUIs
brew 'asciinema'    # Terminal session recorder
brew 'gh'           # GitHub CLI for PRs, issues, repos
brew 'lazydocker'   # Docker management TUI
brew 'lazygit'      # Git management TUI
brew 'sesh'         # Smart tmux session manager

#############################################################
# Software Development                                      #
#############################################################

# Languages and runtimes
brew 'gcc'          # GNU C++ compilers
brew 'go'           # Go compiler
brew 'lua'          # Lua interpreter (required for Neovim plugins)
brew 'node'         # Node.js
brew 'nvm'          # Node version manager
brew 'openjdk'      # Java development kit
brew 'python'       # Python interpreter
brew 'rust'         # Rust language

# DevOps
brew 'ansible'      # Automation
brew 'awscli'       # AWS command line interface
brew 'docker'       # Containers

# Utilities
brew 'git-crypt'    # Transparent encryption for git repos
brew 'interactive-rebase-tool'  # Git interactive rebase TUI
brew 'openssl'      # Cryptography and SSL/TLS Toolkit
brew 'watchman'     # Watch for changes and reload dev server

# Network
brew 'nmap'         # Port scanning

if OS.mac?
  brew 'terminal-notifier'  # Mac notifications from terminal

  # Window manager helpers
  brew 'borders'      # JankyBorders - colored borders for the focused window
end

#############################################################
# Desktop Applications (macOS only)                         #
#############################################################

if OS.mac?
  cask 'aerospace'          # Tiling window manager
  cask 'discord'            # Voice/text chat
  cask 'ghostty'            # Terminal emulator
  cask 'visual-studio-code' # Code editor
  cask 'vlc'                # Media player
end

#############################################################
# VS Code Extensions                                         #
#############################################################

vscode 'anthropic.claude-code'
vscode 'christian-kohler.path-intellisense'
vscode 'codezombiech.gitignore'
vscode 'confluentinc.vscode-confluent'
vscode 'degreat.fonted'
vscode 'donjayamanne.githistory'
vscode 'drewxs.tokyo-night-dark'
vscode 'esbenp.prettier-vscode'
vscode 'golang.go'
vscode 'guichina.code-telescope'
vscode 'haphazarddev.oil-code'
vscode 'humao.rest-client'
vscode 'jacobdufault.fuzzy-search'
vscode 'jannemattila.send-snippet-to-terminal'
vscode 'jellydn.fzf-picker'
vscode 'mongodb.mongodb-vscode'
vscode 'ms-dotnettools.vscode-dotnet-runtime'
vscode 'ms-python.debugpy'
vscode 'ms-python.python'
vscode 'ms-python.vscode-pylance'
vscode 'ms-python.vscode-python-envs'
vscode 'ms-toolsai.datawrangler'
vscode 'ms-toolsai.jupyter'
vscode 'ms-toolsai.jupyter-keymap'
vscode 'ms-toolsai.jupyter-renderers'
vscode 'ms-toolsai.python-ds-extension-pack'
vscode 'ms-toolsai.vscode-jupyter-cell-tags'
vscode 'ms-toolsai.vscode-jupyter-slideshow'
vscode 'ms-vscode-remote.remote-containers'
vscode 'ms-vscode-remote.remote-ssh'
vscode 'ms-vscode-remote.remote-ssh-edit'
vscode 'ms-vscode-remote.remote-wsl'
vscode 'ms-vscode-remote.vscode-remote-extensionpack'
vscode 'ms-vscode.remote-explorer'
vscode 'ms-vscode.remote-repositories'
vscode 'ms-vscode.vscode-speech'
vscode 'redhat.vscode-yaml'
vscode 'redis.redis-for-vscode'
vscode 'usernamehw.errorlens'
vscode 'vitchu.vscode-autohide-vim'
vscode 'vscode-icons-team.vscode-icons'
vscode 'vscodevim.vim'
vscode 'vspacecode.whichkey'
vscode 'ziyasal.vscode-open-in-github'

#############################################################
# macOS-Specific                                            #
#############################################################

if OS.mac?
  tap 'espanso/espanso'
  tap 'koekeishiya/formulae'
  tap 'FelixKratz/formulae'

  # Fonts
  cask 'font-fira-code'
  cask 'font-meslo-lg-nerd-font'
  cask 'font-monaspace-nf'

  # Quick Look plugins
  cask 'qlcolorcode'    # QL for code with highlighting
  cask 'qlmarkdown'     # QL for markdown files
  cask 'qlstephen'      # QL for plain text dev files
  cask 'quicklook-csv'  # QL for CSV tables
  cask 'quicklook-json', args: { require_sha: false }  # QL for JSON

  # macOS productivity
  cask 'alt-tab'        # Better alt-tab window switcher
  cask 'maccy'          # Clipboard manager
  cask 'espanso'        # Live text expander
  cask 'hiddenbar'      # Hide menubar icons
  cask 'keka'           # File archiver and extractor
  cask 'raycast', args: { require_sha: false }  # Spotlight alternative
  cask 'shottr'         # Screenshot utility
  cask 'stats'          # System resource usage in menubar

  # Security
  cask 'gpg-suite'      # PGP encryption for emails and files
end

# EOF
