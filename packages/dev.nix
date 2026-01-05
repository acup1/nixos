{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    cling
    clang

    arduino-ide

    go
    cargo
    gnumake
    python3
  ];
}
