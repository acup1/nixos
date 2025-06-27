{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    cling
    clang

    go
    cargo
    gnumake
    python3
  ];
}
