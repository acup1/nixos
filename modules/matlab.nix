{
  config,
  pkgs,
  ...
}: let
  #nix-matlab = {
  #  inputs.nixpkgs.follows = "pkgs";
  #  url = "gitlab:doronbehar/nix-matlab";
  #};
  flake = builtins.getFlake "gitlab:doronbehar/nix-matlab";
in {
  pkgs.overlays = [
    flake.overlay
  ];

  environment.systemPackages = with pkgs; [
    matlab
  ];
}
