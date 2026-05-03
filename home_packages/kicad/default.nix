{
  pkgs,
  config,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    kicad
  ];
  # xdg.configFile."ghostty".source = ./.config/ghostty;
}
