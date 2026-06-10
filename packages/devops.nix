{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    terraform
    terragrunt
  ];
}
