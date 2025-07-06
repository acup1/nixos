{
  stdenv,
  pkgs,
}:
stdenv.mkDerivation {
  name = "asciiss";
  src = ./.;
  buildInputs = with pkgs; [
    #gcc
    #clang
    #clang-tools
    #cmake
    #pkg-config
    opencv
    ncurses
    stdenv
  ];
  installPhase = ''
    mkdir -p $out/bin
    cp asciiss $out/bin/
  '';
}
