{ pkgs
, config
, inputs
, ...
}: {
  home.packages = with pkgs; [
    swaybg
  ];
  xdg.configFile."hypr".source = ./.config/hypr;
}
