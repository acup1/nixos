{ pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      amnezia-vpn
      #hiddify-app
      # v2rayn
    ];

  programs.amnezia-vpn.enable = true;
  programs.throne.enable = true;
  programs.throne.tunMode.enable = true;
}
