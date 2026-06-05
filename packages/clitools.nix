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

    fastfetch
    cmatrix
    pipes-rs

    comma
  ];
}
