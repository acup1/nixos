{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    waybar
  ];
  xdg.configFile."waybar".source = ../.config/waybar;
}
