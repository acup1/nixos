{pkgs, ...}: let
  nix-matlab = {
    inputs.nixpkgs.follows = "nixpkgs";
    url = "gitlab:doronbehar/nix-matlab";
  };
in {
  pkgs.overlays = [
    nix-matlab.overlay
  ];

  environment.systemPackages = with pkgs; [
    matlab
  ];
}
