{
  description = "cups nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nvf.url = "github:acup1/nvf";
    zen.url = "github:youwen5/zen-browser-flake";
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
