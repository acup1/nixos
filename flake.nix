{
  description = "cups nixos";

  inputs =
    #(import ./modules.nix)
    {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
      #nvf.url = "github:acup1/nvf";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      caelestia-shell = {
        url = "github:caelestia-dots/shell";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs =
    { self
    , nixpkgs
    , ...
    } @ inputs:
    let
      username = "acup";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules =
          [
            ./home.nix
            ./programs/default.nix
          ]
          ++ (nixpkgs.lib.filesystem.listFilesRecursive ./configuration)
          ++ (inputs.nixpkgs.lib.filesystem.listFilesRecursive ./packages)
          ++ (nixpkgs.lib.filesystem.listFilesRecursive ./modules);
        specialArgs = { inherit self inputs system username; };
      };
    };
}
