{lib, pkgs, ...}: let
  hostSystem = pkgs.stdenv.hostPlatform.system;
  zen = builtins.getFlake "github:youwen5/zen-browser-flake";
  zenPackage = zen.packages.${hostSystem}.default or (throw
    "Package 'default' not found in the flake");
in {
  environment.systemPackages = [
    (zenPackage.overrideAttrs (old: {
      # Zen loads AAC/H.264 decoders at runtime; keep a supported FFmpeg major.
      makeWrapperArgs = (old.makeWrapperArgs or []) ++ [
        "--prefix"
        "LD_LIBRARY_PATH"
        ":"
        (lib.makeLibraryPath [pkgs.ffmpeg_8])
      ];
    }))
  ];
}
