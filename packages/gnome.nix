{ pkgs, ... }: {
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
  environment.systemPackages = with pkgs; [ gnomeExtensions.screen-rotate ];
}
