{inputs, ...}: {
  environment.systemPackages = [
    inputs.nix-gaming.packages.x86_64-linux.wine-ge
  ];
}
