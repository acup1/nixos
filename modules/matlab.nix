{
  config,
  pkgs,
  ...
}: let
  nix-matlab = builtins.getFlake "gitlab:doronbehar/nix-matlab";
in {
  nixpkgs.overlays = [
    nix-matlab.overlay
  ];

  environment.systemPackages = with pkgs; [
    matlab
  ];
}
