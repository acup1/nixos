{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    # libgcc
    cling
    clang

    # rustc
    # rustup
    # cargo
    #
    # arduino-ide

    go
    gnumake
    python3
  ];
}
