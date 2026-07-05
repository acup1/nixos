{
  pkgs,
  lib,
  ...
}: let
  customTerraform = pkgs.stdenv.mkDerivation {
    name = "terraform-local-bin";
    src = ../custom/terraform/bin;
    installPhase = ''
      mkdir -p $out/bin
      cp terraform $out/bin/terraform
      chmod +x $out/bin/terraform
    '';
  };
in {
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    # terraform
    customTerraform
    terragrunt
  ];
}
