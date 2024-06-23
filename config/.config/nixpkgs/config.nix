{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "sunil-tools";
      paths = [
        bat
        go
        zoxide
        curl
        readline
        lua
        luajit
        unzip
        libtool
        openssl
        gettext
        lsof
        ccache
        clang-tools
        python3
        python3Packages.pip
        python3Packages.virtualenv
        nodejs_22
        yarn
        nodePackages.eslint
        nodePackages.typescript-language-server
        neovim
        luajitPackages.luarocks
        vim
        jq
        watch
        tmux
        fzf
        htop
        xclip
        xsel
        tldr
        ripgrep
        colordiff
        fd
        rustup
        justbuild
        delta
        btop
        git
        hyperfine
        lazydocker
        stow
        ncdu
        exa
        awscli
        neofetch
        gh
        lazygit
        k9s
        kubectl
        wget
        lf
        starship
        kubectx
        fluxcd
      ];
    };
  };
}