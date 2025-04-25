{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    cava
  ];
  xdg.configFile."cava".source = ./.config/cava;
}
