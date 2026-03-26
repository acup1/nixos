{ pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      # amnezia-vpn
      #hiddify-app
    ];

  # programs.amnezia-vpn.enable = true;
  programs.throne.enable = true;
  programs.throne.tunMode.enable = true;
}
