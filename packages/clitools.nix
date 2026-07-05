{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    unzip
    fzf
    zsh
    git
    sshfs

    bat
    neovim
    zellij

    fastfetch
    cmatrix
    pipes-rs

    comma

    yq
  ];
}
