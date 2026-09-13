{ config, pkgs, inputs, ... }:
let
  hostSystem = pkgs.stdenv.hostPlatform.system;
  zen = builtins.getFlake "github:youwen5/zen-browser-flake";
in {
  environment.systemPackages = with pkgs;
    [
      (
        zen.packages.${hostSystem}.default or (throw
          "Package 'default' not found in the flake")
      )
    ];
}
