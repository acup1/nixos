{
  config,
  pkgs,
  ...
}: let
  flake = builtins.getFlake "github:acup1/nvf";
in {
  environment.systemPackages = with pkgs; [
    (flake.packages.${system}.default or (throw "Package 'default' not found in the flake"))
    neovide
  ];
}
