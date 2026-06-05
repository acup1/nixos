{ pkgs
, config
, inputs
, ...
}: {
  home.packages = with pkgs; [
    ghostty-bin
  ];
  xdg.configFile."ghostty".source = ./.config/ghostty;
}
