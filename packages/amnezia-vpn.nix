{nixpkgs, ...}: {
  environment.systemPackages = with nixpkgs; [
    amnezia-vpn
  ];

  programs.amnezia-vpn.enable = true;
}
