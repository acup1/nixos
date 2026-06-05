{
  description = "cups nix(mac)os";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs"; #?ref=nixos-26.05";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager"; # /release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    configFile =
      if builtins.pathExists /nix/config.nix
      then import /nix/config.nix
      else throw "`/nix/config.nix` is missing";

    username = configFile.username or (throw "variable `username` in `/nix/config.nix` is missing");
    system = configFile.system or (throw "variable `system` in `/nix/config.nix` is missing");
    flakeDir = configFile.flakeDir or (throw "variable `flakeDir` in `/nix/config.nix` is missing");
  in {
    darwinConfigurations."${username}-OSX" = inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      modules =
        [
        ]
        ++ (nixpkgs.lib.filesystem.listFilesRecursive ./darwin-configuration)
        ++ (inputs.nixpkgs.lib.filesystem.listFilesRecursive ./packages);
      specialArgs = {
        inherit
          self
          inputs
          system
          username
          flakeDir
          ;
      };
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {system = system;};
      modules = [
        ./home.nix
      ];
      extraSpecialArgs = {
        inherit
          self
          inputs
          username
          system
          flakeDir
          ;
      };
    };
  };
}
