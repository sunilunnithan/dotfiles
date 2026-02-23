#############################################################
# ~/.Brewfile - Software Installs for MacOS                 #
#############################################################

# Options
cask_args appdir: '/Volumes/Samsung/Applications', require_sha: true

# Taps
tap 'homebrew/bundle'
tap 'homebrew/services'
tap 'espanso/espanso'
tap 'jesseduffield/lazygit'
tap 'koekeishiya/formulae'

#############################################################
# Command Line                                              #
#############################################################

# Essentials
brew 'git'          # Version control
brew 'neovim'       # Text editor
brew 'tmux'         # Terminal multiplexer

# Modern CLI tools
brew 'bat'          # Output highlighting (better cat)
brew 'delta'        # Syntax-highlighting pager for git
brew 'fd'           # Fast file finder (better find)
brew 'fzf'          # Fuzzy file finder and filtering
brew 'glow'         # Markdown renderer for terminal
brew 'hyperfine'    # Benchmarking for arbitrary commands
brew 'jq'           # JSON parser, output and query files
brew 'eza'          # Modern ls replacement
brew 'lf'           # Terminal file manager
brew 'pastel'       # Color manipulation tool
brew 'ripgrep'      # Searching within files (better grep)
brew 'sd'           # RegEx find and replace (better sed)
brew 'starship'     # Cross-shell prompt
brew 'tldr'         # Community-maintained docs (better man)
brew 'tree'         # Directory listings as tree structure
brew 'zoxide'       # Auto-learning navigation (better cd)

# Monitoring
brew 'btop'         # Resource monitor (better htop)
brew 'ncdu'         # Disk usage analyzer (better du)

# Development TUIs
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
brew 'terminal-notifier'  # Mac notifications from terminal
brew 'watchman'     # Watch for changes and reload dev server

# Network
brew 'nmap'         # Port scanning

#############################################################
# Desktop Applications                                      #
#############################################################

cask 'ghostty'            # Terminal emulator
cask 'visual-studio-code' # Code editor
cask 'vlc'                # Media player

#############################################################
# macOS-Specific                                            #
#############################################################

# Fonts
cask 'font-fira-code'
cask 'font-meslo-lg-nerd-font'

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
brew 'skhd'           # Hotkey daemon for macOS
cask 'stats'          # System resource usage in menubar
brew 'yabai'          # Tiling window manager

# Security
cask 'gpg-suite'      # PGP encryption for emails and files

# Browser
cask 'brave-browser'

# EOF
