{
  config,
  pkgs,
  inputs,
  ...
}: let
  zen = builtins.getFlake "github:youwen5/zen-browser-flake";
in {
  environment.systemPackages = with pkgs; [
    (zen.packages.${system}.default or (throw "Package 'default' not found in the flake"))
  ];
}
