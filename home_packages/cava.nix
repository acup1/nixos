{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    cava
  ];
  xdg.configFile."cava/config".source = ../.config/cava/config;
}
