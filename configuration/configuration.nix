# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  #imports = [
  #  # Include the results of the hardware scan.
  #  ./hardware-configuration.nix
  #];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  # amnezia-vpn

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  programs.zsh.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.acup = {
    isNormalUser = true;
    description = "acup";
    extraGroups = ["networkmanager" "wheel" "lp"];
    packages = with pkgs; [
      #  thunderbird
    ];
    home = "/run/media/disk/acup";
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    #vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    hyprlock
    wget
    unzip
    gcc
    rocmPackages_5.llvm.clang
    go
    cargo
    gnumake42
    #wl-clipboard-rs
    wl-clipboard-x11
    xclip
    fzf
    telegram-desktop
    brightnessctl
    playerctl
    zsh
    alacritty
    ghostty
    git
    waybar
    rofi-wayland
    hyprpaper
    tor-browser
    networkmanagerapplet
    swaynotificationcenter
    cava
    neofetch
    yazi
    btop
    grim
    slurp
    grimblast
    gimp
    unstable.amnezia-vpn
    octaveFull
    gfortran
    libreoffice-qt6-fresh
    protonplus
    bottles
    cmatrix
    pipes-rs
    qbittorrent
    qalculate-gtk
    python3Full
    fxlinuxprint
    cups
    hal-hardware-analyzer
    usbutils
    dmg2img
    p7zip
    nodejs
    nwg-dock-hyprland
    kdePackages.calligra
    onlyoffice-desktopeditors
    obs-studio
    wineWowPackages.waylandFull
    #unstable.wpsoffice
    matlab
    wpsoffice-cn
    neovide
  ];

  nixpkgs.overlays = [
    inputs.nix-matlab.overlay
    (
      final: prev: {
        # Your own overlays...
      }
    )
  ];

  #programs.nvf = {
  #  enable = true;
  #  # your settings need to go into the settings attribute set
  #  # most settings are documented in the appendix
  #  #settings = {
  #  #  vim.viAlias = false;
  #  #  vim.vimAlias = true;
  #  #  vim.lsp = {
  #  #    enable = true;
  #  #  };
  #  #  vim.languages.nix.enable=true;
  #  #};
  #};

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      unstable.libgbm
    ];
  };
  #environment.systemPackages = with unstable-pkgs; [
  #  amnezia-vpn
  #];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
