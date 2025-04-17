{
  config,
  pkgs,
  inputs,
  ...
}: let
  #flake = builtins.getFlake "github:acup1/nvf";
  #flake.url = "github:acup1/nvf";
in {
  #inputs.nvf.url = "github:acup1/nvf";
  environment.systemPackages = with pkgs; [
    (inputs.nvf.packages.${system}.default or (throw "Package 'default' not found in the flake"))
    neovide
  ];
}
