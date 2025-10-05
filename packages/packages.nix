{ pkgs, inputs, system, ... }: {
  environment.systemPackages = with pkgs; [
    hyprland
    hyprlock
    hyprpaper
    cliphist
    gpu-screen-recorder

    wget
    unzip
    #wl-clipboard-rs
    wl-clipboard-x11
    xclip
    fzf
    brightnessctl
    playerctl
    zsh
    alacritty
    git
    tor-browser
    networkmanagerapplet
    neofetch
    grim
    slurp
    grimblast
    cmatrix
    pipes-rs
    qbittorrent
    qalculate-gtk
    fxlinuxprint
    cups
    hal-hardware-analyzer
    usbutils
    p7zip
    nodejs
    obs-studio
    wineWowPackages.waylandFull
    github-desktop

    vlc
    mpv
    nautilus
    pipewire
    scdoc
    #inputs.caelestia-shell.packages.${system}.default
    comma
  ];
  nixpkgs.config.permittedInsecurePackages = [ "qtwebengine-5.15.19" ];
}
