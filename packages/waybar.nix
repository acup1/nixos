{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    waybar
  ];
  xdg.configFile."waybar".source = ../.config/waybar;
  #xdg.configFile."waybar/config.jsonc".source = ./.config/waybar/config.jsonc;
  #xdg.configFile."swaync/config.json".source = ./config.json;
}
