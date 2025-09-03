{ pkgs
, config
, inputs
, ...
}: {
  home.packages = with pkgs; [
    ghostty
  ];
  xdg.configFile."ghostty".source = ./.config/ghostty;
}
