{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "sunil-tools";
      paths = [
        # Essentials
        git
        neovim
        tmux
        curl
        wget

        # Modern CLI replacements
        bat           # better cat
        eza           # better ls
        fd            # better find
        ripgrep       # better grep
        sd            # better sed
        delta         # better diff (git pager)
        zoxide        # better cd
        tree

        # Fuzzy finding
        fzf

        # Productivity
        starship      # cross-shell prompt
        glow          # markdown renderer
        hyperfine     # benchmarking
        jq            # JSON processor
        lf            # terminal file manager
        pastel        # color tool
        tldr          # community man pages

        # Monitoring
        btop          # better htop
        ncdu          # disk usage

        # Dev TUIs
        gh            # GitHub CLI
        lazygit       # git TUI
        lazydocker    # docker TUI
        sesh          # tmux session manager

        # Languages & runtimes
        gcc
        go
        lua
        nodejs_22
        python3
        python3Packages.pip
        python3Packages.virtualenv
        cargo         # Rust package manager

        # DevOps
        ansible
        awscli2
        kubectl
        kubectx
        k9s

        # Utilities
        git-crypt
        nmap
        openssl
        lsof
        gettext
        watch
      ] ++ lib.optionals stdenv.isLinux [
        xclip
        xsel
      ];
    };
  };
}
