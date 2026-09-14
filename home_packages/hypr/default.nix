{
  pkgs,
  config,
  inputs,
  ...
}: let
  hostSystem = pkgs.stdenv.hostPlatform.system;
  hyprland = inputs.hyprland.packages.${hostSystem}.hyprland;
  sunshineHeadless = pkgs.writeShellScript "sunshine-headless" ''
    set -eu

    if ! ${hyprland}/bin/hyprctl monitors all \
      | ${pkgs.gnugrep}/bin/grep -q '^Monitor SUNSHINE '; then
      ${hyprland}/bin/hyprctl output create headless SUNSHINE
    fi

    # При старте без разъёмов Hyprland сам создаёт временный HEADLESS-0.
    # После появления именованного выхода он больше не нужен.
    if ${hyprland}/bin/hyprctl monitors all \
      | ${pkgs.gnugrep}/bin/grep -q '^Monitor HEADLESS-0 '; then
      ${hyprland}/bin/hyprctl output remove HEADLESS-0
    fi
  '';
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
      extraCommands = [
        "${pkgs.systemd}/bin/systemctl --user stop hyprland-session.target"
        "${sunshineHeadless}"
        "${pkgs.systemd}/bin/systemctl --user start hyprland-session.target"
      ];
    };

    plugins = [
      # inputs.hyprgrass.packages.${hostSystem}.default
      # inputs.Hyprspace.packages.${hostSystem}.Hyprspace
    ];
  };
  # xdg.configFile."hypr".source = ./.config/hypr;
}
