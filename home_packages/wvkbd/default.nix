{ pkgs, ... }:

{
  home.packages = [ pkgs.wvkbd ];

  systemd.user.services.wvkbd = {
    Unit = { Description = "wvkbd"; };
    Install = { WantedBy = [ "default.target" ]; };

    Service = {
      ExecStart = "${pkgs.wvkbd}/bin/wvkbd-mobintl --hidden -L 230";
      Restart = "always";
      RestartSec = 2;
    };
  };

}
