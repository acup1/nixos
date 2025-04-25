{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    waybar
  ];
  #home.folder.".config/waybar".source = ../.config/waybar;
  #xdg.configFile."waybar".source = builtins.path {
  #  path = ../.config/waybar;
  #  name = "waybar-config";
  #};
  #xdg.configFolder."waybar".source = ../.config/waybar;
  #xdg.configFile."swaync/config.json".source = ./config.json;
}
