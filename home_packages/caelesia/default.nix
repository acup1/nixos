{ pkgs, ... }: {
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      bar.status = {
        showBattery = true;
        showKbLayout = true;
      };
      toast.enable = false;
      appearance = {
        font.size.scale = 1.0; # 125 %
        padding.scale = 2;
        rounding.scale = 0.5;
        spacing.scale = 1.0;
        anim.durations.scale = 1.0;
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = { theme.enableGtk = true; };
    };
  };

  xdg.desktopEntries = {
    "caelestia-reload" = {
      name = "caelestia-reload";
      genericName = "caelestia-reload";
      exec = ''sh -c "pkill quickshell && caelestia shell -d"'';
      icon = ./reload.png;
      comment = "reload caelestia";
      terminal = false;
      type = "Application";
      categories = [ ];
    };
  };

}
