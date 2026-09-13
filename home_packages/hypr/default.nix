{
  pkgs,
  config,
  inputs,
  ...
}: let
  hostSystem = pkgs.stdenv.hostPlatform.system;
in {
  home.packages = with pkgs; [
    inputs.iio-hyprland.packages.${hostSystem}.default
    squeekboard
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${hostSystem}.hyprland;

    extraConfig = ''
      source = dms/binds.conf
      ${builtins.readFile ./.config/hypr/hyprland.conf}
      ${builtins.readFile ./.config/hypr/autostart.conf}
      ${builtins.readFile ./.config/hypr/inputnbindings.conf}
    '';
    systemd = {
      enable = false;
      variables = ["--all"];
    };

    plugins = [
      # inputs.hyprgrass.packages.${hostSystem}.default
      # inputs.Hyprspace.packages.${hostSystem}.Hyprspace
    ];
  };
  # xdg.configFile."hypr".source = ./.config/hypr;
}
