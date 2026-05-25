{
  pkgs,
  inputs,
  system,
  ...
}: {
  environment.systemPackages = with pkgs; [
    hyprland
    cliphist
    fuzzel

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

    grimblast
    qbittorrent
    qalculate-gtk
    fxlinuxprint
    cups
    hal-hardware-analyzer
    usbutils
    p7zip
    nodejs
    obs-studio
    wineWow64Packages.waylandFull

    vlc
    mpv
    nautilus
    pipewire
    scdoc
    comma
  ];
  nixpkgs.overlays = [
    (_: prev: {
      openldap = prev.openldap.overrideAttrs {
        doCheck = !prev.stdenv.hostPlatform.isi686;
      };
    })
  ];
  nixpkgs.config.permittedInsecurePackages = ["qtwebengine-5.15.19"];
}
