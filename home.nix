{ config, pkgs, lib, ... }:


{

  imports = [
    ./zsh.nix
    ./python.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;


  home.packages = with pkgs; [
    nix-du
    nixfmt-rfc-style
    nix-du
    nix-tree
    graphviz

    zlib
    cargo
    gnutar
    gzip

  # Terminal fun
    lolcat
    tree
    cowsay
    cmatrix
    neofetch
    figlet
    sxiv
    w3m
    lf
    chafa
    fpp


  # CLI tools
    gnumake 
    gcc
    wget
    curl
    htop 
    duf
    bat
    ripgrep
    easyrsa
    fd
    fzf 
    zip
    unzip
    zsh
    zsh-fast-syntax-highlighting
    openssh
    aspell
    aspellDicts.en
    unrar
    which
    man-db
    dig
    sysz
    patch
    vim
    tmux
    tmuxinator
    neovim
    lunarvim
    tree-sitter
    man
    jq
    git
    meson
    iperf
    nmap
    kubectl
    nix-prefetch-git

  # AWS
    awscli2
    ssm-session-manager-plugin
    git-remote-codecommit

  # Node
    nodejs
    nodePackages.neovim

  # Lsp
    pyright
    lua-language-server
    dockerfile-language-server-nodejs
    nodePackages.typescript-language-server
    nodePackages.bash-language-server

  ];

}
