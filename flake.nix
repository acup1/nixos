{
  description = "cups nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nix-matlab = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "gitlab:doronbehar/nix-matlab";
    };

    zen.url = "github:youwen5/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        ./modules
      ];
      specialArgs = {inherit self inputs;};
    };
  };
}
