{
  pkgs,
  config,
  inputs,
  ...
}: {
  xdg.configFile."hypr".source = ../config/hypr;
}
