{
  inputs,
  pkgs,
  services,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    slurp
    grim
    iio-niri
    maliit-keyboard
    maliit-framework
  ];
  environment.sessionVariables = {
    MALIIT_PLUGINS_DIR = "${pkgs.maliit-keyboard}/lib/maliit/plugins";
    XDG_CURRENT_DESKTOP = "niri";
    NIXOS_OZONE_WL = "1";
  };

  programs.niri.enable = true;
  # programs.niri.package = inputs.niri.packages.${pkgs.system}.niri;

  xdg.portal = {
    enable = true;
    config.common.default = [
      # "gnome"
      # "hyprland"
      "gtk"
    ];
    wlr.enable = true;
    wlr.settings = {
      screencast = {
        output_name = "eDP-1";
        chooser_type = "simple";
        chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
      };
    };
    extraPortals = [
      # pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      # pkgs.xdg-desktop-portal-hyprland
    ];
  };
  # services.gnome.xdg-desktop-portal-gnome.enable = true;
}
