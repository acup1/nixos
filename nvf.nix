{
  config,
  pkgs,
  ...
}: let
  flake = builtins.getFlake ".";
in {
  environment.systemPackages = with pkgs; [
    (flake.packages.${system}.default or (throw "Package 'default' not found in the flake"))
  ];
}
