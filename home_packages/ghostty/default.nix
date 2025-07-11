{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    ghostty
  ];
  #xdg.configFile."waybar".source = ./.config/waybar;
  xdg.configFile."ghostty".source = ./.config/ghostty;
}
