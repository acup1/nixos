{
  pkgs,
  config,
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
    configType = "hyprlang";

    extraConfig = ''
      source = dms/binds.conf
      ${builtins.readFile ./.config/hypr/hyprland.conf}
      ${builtins.readFile ./.config/hypr/autostart.conf}
      ${builtins.readFile ./.config/hypr/inputnbindings.conf}

      monitor = SUNSHINE, 1920x1080@60, 0x0, 1
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
