{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    cling
    rocmPackages_5.llvm.clang

    go
    cargo
    gnumake42
    (python3.withPachages (ps:
      with ps; [
        oct2py
        jupyter
        ipython
      ]))
    gfortran
  ];
}
