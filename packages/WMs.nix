# { pkgs, ... }: {
#   environment.systemPackages = with pkgs; [ xwayland-satellite ];
#   programs.niri.enable = true;
#
#   xdg.portal = {
#     enable = true;
#     wlr.enable = false;
#     extraPortals = with pkgs; [
#       xdg-desktop-portal-gnome
#       xdg-desktop-portal-gtk
#       xdg-desktop-portal-hyprland
#     ];
#     config = {
#       niri = {
#         default = [ "gnome" "gtk" ];
#         "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
#       };
#     };
#   };
#
#   services.pipewire.enable = true;
#   services.gnome.gnome-keyring.enable = true;
#   systemd.user.services.xdg-desktop-portal-gnome = {
#     wantedBy = [ "graphical-session.target" ];
#     wants = [ "pipewire.service" ];
#     after = [ "pipewire.service" ];
#   };
#
# }

# { pkgs, ... }: {
#   environment.systemPackages = with pkgs; [ xwayland-satellite ];
#   programs.niri.enable = true;
#   services.dbus.enable = true;
#
#   services.gnome.gnome-keyring.enable = true;
#
#   xdg.portal = {
#     enable = true;
#     extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
#     configPackages = [ pkgs.xdg-desktop-portal-gnome ];
#     wlr.enable = true;
#     config.niri.default = "wlr";
#   };
#
#   # Убедитесь что PipeWire включен
#   services.pipewire.enable = true;
#
#   systemd.user.services.xdg-desktop-portal-gnome = {
#     wantedBy = [ "graphical-session.target" ];
#     wants = [ "pipewire.service" ];
#     after = [ "pipewire.service" ];
#   };
# }

# { pkgs, ... }: {
#   environment.systemPackages = with pkgs; [ xwayland-satellite ];
#
#   programs.niri.enable = true;
#
#   services.pipewire.enable = true;
#
#   xdg.portal = {
#     enable = true;
#     extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
#     config.niri.default = [ "gnome" "gtk" ];
#   };
#
#   # Автозапуск портала GNOME
#   systemd.user.services.xdg-desktop-portal-gnome = {
#     enable = true;
#     wantedBy = [ "xdg-desktop-portal.service" ];
#   };
# }

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ xwayland-satellite slurp grim ];

  programs = { niri.enable = true; };

  xdg.portal = {
    enable = true;
    config = {
      common = {
        # default = "wlr";
      };
    };
    wlr.enable = false;
    wlr.settings = {
      screencast = {
        output_name = "eDP-1";
        chooser_type = "simple";
        chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
  #
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.gnome-session ];
  #   configPackages = [ pkgs.xdg-desktop-portal-gtk pkgs.gnome-session ];
  #   config.common.default = "color-scheme";
  #   config.common."color-scheme" = "1";
  # };
  #
}
