{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python314Full
    python314Packages.sympy
  ];
}
