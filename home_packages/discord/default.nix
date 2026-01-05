{ pkgs, ... }: {
  # home.packages = with pkgs; [ ];

  xdg.desktopEntries = {
    "Discord" = {
      name = "Discord";
      genericName = "discord";
      exec = ''sh -c "${pkgs.nix}/bin/nix-shell -p discord --run discord"'';
      icon = ./discord.png;
      comment = "start discord";
      terminal = false;
      type = "Application";
      categories = [ "Network" "InstantMessaging" ];
    };

  };
}
