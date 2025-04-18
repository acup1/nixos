{
  description = "cups nixos";

  inputs =
    #(import ./modules.nix)
    {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
      #nvf.url = "github:acup1/nvf";
    };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      modules =
        [
        ]
        ++ (nixpkgs.lib.filesystem.listFilesRecursive ./configuration)
        ++ (nixpkgs.lib.filesystem.listFilesRecursive ./packages)
        ++ (nixpkgs.lib.filesystem.listFilesRecursive ./modules);
      specialArgs = {inherit self inputs;};
    };
  };
}
