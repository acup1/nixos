{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ xwayland-satellite slurp grim ];

  programs.niri.enable = true;
  programs.niri.package = inputs.niri.packages.${pkgs.system}.niri;

  xdg.portal = {
    enable = true;
    config.common.default = [ "gnome" "hyprland" "gtk" ];
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
}
