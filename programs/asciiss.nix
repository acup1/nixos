{stdenv}:
stdenv.mkDerivation {
  name = "asciiss";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp asciiss $out/bin/
  '';
}
