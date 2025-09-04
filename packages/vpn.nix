{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    amnezia-vpn
    #hiddify-app
  ];

  programs.amnezia-vpn.enable = true;
}
