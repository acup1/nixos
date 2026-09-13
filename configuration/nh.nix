{ flakeDir, lib, pkgs, ... }:

let
  # The machine-specific hardware module lives outside the flake in /etc/nixos.
  # Keep nh's other commands pure and opt out only for NixOS builds.
  nhWrapper = pkgs.writeShellApplication {
    name = "nh";
    text = ''
      args=("$@")

      case "''${args[0]-}:''${args[1]-}" in
        os:switch|os:boot|os:test|os:build|os:build-vm|os:build-image)
          hasImpure=false

          for arg in "''${args[@]}"; do
            if [[ "$arg" == "--impure" ]]; then
              hasImpure=true
              break
            fi
          done

          if [[ "$hasImpure" == false ]]; then
            args+=(--impure)
          fi
          ;;
      esac

      exec ${lib.getExe pkgs.nh} "''${args[@]}"
    '';
  };

  nhWithImpureOs = pkgs.symlinkJoin {
    name = "nh-${pkgs.nh.version}-with-impure-os";
    paths = [ pkgs.nh ];
    meta.mainProgram = "nh";
    postBuild = ''
      rm "$out/bin/nh"
      ln -s ${lib.getExe nhWrapper} "$out/bin/nh"
    '';
  };
in
{
  programs.nh = {
    enable = true;
    flake = flakeDir;
    package = nhWithImpureOs;
  };
}
