{
  pkgs,
  inputs,
  ...
}: let
  hostSystem = pkgs.stdenv.hostPlatform.system;
  hyprland = inputs.hyprland.packages.${hostSystem}.hyprland;
in {
  home.packages = with pkgs; [
    inputs.iio-hyprland.packages.${hostSystem}.default
    squeekboard
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    configType = "lua";

    extraConfig = ''
      ${builtins.readFile ./.config/hypr/settings.lua}
      ${builtins.readFile ./.config/hypr/autostart.lua}
      ${builtins.readFile ./.config/hypr/inputnbindings.lua}
    '';
    systemd = {
      enable = true;
      variables = [
        "DISPLAY"
        "HYPRLAND_INSTANCE_SIGNATURE"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_TYPE"
      ];
    };

    plugins = [
      # inputs.hyprgrass.packages.${hostSystem}.default
      # inputs.Hyprspace.packages.${hostSystem}.Hyprspace
    ];
  };
  # xdg.configFile."hypr".source = ./.config/hypr;
}
