{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    amnezia-vpn
  ];

  programs.amnezia-vpn.enable = true;
}
