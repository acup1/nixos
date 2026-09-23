{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.waylandkb.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
