{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python314Full
  ];
}
