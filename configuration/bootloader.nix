{ config, pkgs, ... }:
let theme = pkgs.callPackage ../grub_themes/intervals-grub-theme { };
in {
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    theme = theme;
    gfxmodeEfi = "1920x1080";
  };
  boot.loader = {
    timeout = 2;
    efi.canTouchEfiVariables = true;
  };
}
