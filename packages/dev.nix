{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    libgccjit
    cling
    clang

    rustc
    rustup
    cargo

    arduino-ide

    go
    gnumake
    python3
  ];
}
