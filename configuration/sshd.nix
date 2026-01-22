{ config, pkgs, inputs, ... }: {
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ 22 ];
}
