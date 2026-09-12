{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    amnezia-vpn
    # hiddify-app
    # v2raya
    clash-verge-rev
    # flclash
  ];

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
    autoStart = true;
  };
  # networking.firewall.trustedInterfaces = ["Mihomo"];
  programs.amnezia-vpn.enable = true;
  # services.flclash.enable = true;
  # services.v2raya.enable = true;
  # programs.throne.enable = true;
  # programs.throne.tunMode.enable = true;
  # security.polkit.extraConfig = ''
  #   polkit.addRule(function(action, subject) {
  #     if (action.id == "com.follow.clash.tun" &&
  #         subject.isInGroup("wheel")) {
  #       return polkit.Result.YES;
  #     }
  #   });
  # '';
  # programs.clash-verge.enable = true;
  # security.wrappers.FlClashCore = {
  #   setuid = true;
  #   owner = "root";
  #   group = "root";
  #   source = "${pkgs.flclash}/app/flclash/FlClashCore";
  # };
}
