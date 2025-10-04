{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    rofi
  ];
  xdg.configFile."rofi".source = ./.config/rofi;
}
