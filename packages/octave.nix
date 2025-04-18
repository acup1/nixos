{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    octaveFull
  ];
}
