{ pkgs, config, inputs, ... }:
let
in {
  home.packages = with pkgs; [
    inputs.iio-hyprland.packages.${pkgs.system}.default
    squeekboard
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    extraConfig = ''
      ${builtins.readFile ./.config/hypr/hyprland.conf}
    '';
    systemd = {
      enable = false;
      variables = [ "--all" ];
    };

    plugins = [
      inputs.hyprgrass.packages.${pkgs.system}.default
      # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];

  };
  # xdg.configFile."hypr".source = ./.config/hypr;
}
