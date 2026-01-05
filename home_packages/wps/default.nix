{ pkgs, ... }: {
  # home.packages = with pkgs; [ ];

  xdg.desktopEntries = {
    "WPS" = {
      name = "Wps";
      genericName = "wps";
      exec = ''
        python -c "import os;f=%F;fn=f[f.rfind('/')+1:];os.chdir(f[:f.rfind('/')]);os.system(f'wps {chr(34)}{fn}{chr(34)}')"'';
      icon = "wps";
      comment = "start wps";
      terminal = false;
      type = "Application";
      categories = [ "Network" "InstantMessaging" ];
    };

  };
}
