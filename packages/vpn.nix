{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    amnezia-vpn
    #hiddify-app
    # v2rayn
    clash-verge-rev
  ];

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
    autoStart = true;
  };
  networking.firewall.trustedInterfaces = ["Mihomo"];
  programs.amnezia-vpn.enable = true;
  programs.throne.enable = true;
  programs.throne.tunMode.enable = true;
}
