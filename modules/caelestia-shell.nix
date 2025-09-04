{ config
, pkgs
, inputs
, ...
}:
let
  caelestia-shell = builtins.getFlake "github:caelestia-dots/shell";
in
{
  environment.systemPackages = with pkgs; [
    #(caelestia-shell.packages.${system}.default or (throw "Package 'default' not found in the flake"))
  ];
}
