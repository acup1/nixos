{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    muffon
  ];
  # xdg.configFile."ghostty".source = ./.config/ghostty;
}
