{ pkgs ? import <nixpkgs> { }, ... }:
let
  override = ./theme;
in
pkgs.stdenvNoCC.mkDerivation {
  name = "intervals-grub-theme";
  src = pkgs.fetchurl {
    url = "https://github.com/yeyushengfan258/Intervals-grub-theme/raw/21119056cf62d67ea5ae0ba6d7e4b06696ab27b9/releases/Intervals-window-grub-themes.tar.xz";
    sha256 = "1wm6q6s9fflrxpi0l3l6vqsvh37q1i9njk8x48pmvxkhl1d7irvl";
  };
  nativeBuildInputs = [ pkgs.xz ];
  unpackPhase = ''
    tar -xJf $src
  '';
  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r Intervals-window-grub-themes/1080p/Intervals-window/* $out/
    cp -rf ${override}/* $out/

    runHook postInstall
  '';
}
