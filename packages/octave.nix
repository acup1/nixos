{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    octaveFull
    python312Packages.sympy
    python313Packages.sympy
  ];
}
