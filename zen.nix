{ config, pkgs, ... }:
let
  zen = builtins.getFlake "github:youwen5/zen-browser-flake";
  #nvf = builtins.getFlake "/etc/nixos/nvf/";
in
{
  environment.systemPackages = with pkgs; [
    (zen.packages.${system}.default or (throw "Package 'default' not found in the flake"))
    #(nvf.packages.${system}.default or (throw "Package 'default' not found in the flake"))
  ];
}
