{ config, pkgs, lib, ... }:

{
  # services.fprintd = {
  #   enable = true;
  #   tod = {
  #     enable = true;
  #     driver =
  #       pkgs.libfprint-2-tod1-goodix; # for Goodix sensors (common in ThinkPads, Dell, etc.)
  #     # driver = pkgs.libfprint-2-tod1-vfs009x; # for Validity sensors
  #     # driver = pkgs.libfprint-2-tod1-elan;    # for Elan sensors
  #   };
  # };
  #
  security.pam.services = {
    login.fprintAuth = lib.mkForce true;
    sudo.fprintAuth = lib.mkForce true;
    # Or more generally:
    # "*".fprintAuth = true;
  };

  environment.systemPackages = with pkgs; [ fprintd ];
  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix; # change if needed
    };
  };

}
