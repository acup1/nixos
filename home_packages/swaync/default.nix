{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    swaynotificationcenter
  ];
  xdg.configFile."swaync".source = ./.config/swaync;
}
