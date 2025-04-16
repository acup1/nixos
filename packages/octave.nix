{pkgs, ...}: {
  environment.systemPackages = with pkgs;
    [
      octaveFull
    ]
    ++ (with pkgs.python312Packages; [
      sympy
    ]);
}
