{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "sunil-tools";
      paths = [
        bat
        go
        zoxide
        curl
        openssl
        gettext
        lsof
        python3
        python3Packages.pip
        python3Packages.virtualenv
        nodejs_22
        yarn
        nodePackages.eslint
        nodePackages.typescript-language-server
        neovim
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
        fd
        delta
        btop
        git
        hyperfine
        lazydocker
        neofetch
        gh
        lazygit
        k9s
        kubectl
        wget
        starship
        kubectx
        fluxcd
      ];
    };
  };
}
