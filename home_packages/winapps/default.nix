{ pkgs, config, inputs, ... }:
{
  # home.packages = with pkgs; [
  #   inputs.winapps.packages."${system}".winapps
  #   inputs.winapps.packages."${system}".winapps-launcher
  # ];
  # xdg.configFile."waybar".source = ./.config/waybar;
}
