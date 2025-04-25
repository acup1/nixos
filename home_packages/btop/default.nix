{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    btop
  ];
  xdg.configFile."btop".source = ./.config/btop;
}
