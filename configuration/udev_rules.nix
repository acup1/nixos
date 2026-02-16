{ pkgs, ... }:
let
  # openrgbRules = pkgs.fetchurl {
  #   url = "https://openrgb.org/releases/release_0.9/60-openrgb.rules";
  #   sha256 = "sha256-txvs6bHped0IVUoktwA7bXu2136lVOJhNUI/hMGvqzg=";
  # };
  # openrgbRules_text = builtins.readFile openrgbRules;
in
{
  services.udev.extraRules = ''
    # Micronucleus rules for Digispark / ATTINY85 bootloader
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666"
    KERNEL=="ttyACM*", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="0753", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1"
  '';
}
