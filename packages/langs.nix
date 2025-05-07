{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    cling
    rocmPackages_5.llvm.clang

    go
    cargo
    gnumake42
    python314Full
    gfortran
  ];
}
