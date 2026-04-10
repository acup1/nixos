{
  description = "cups nixos";

  inputs =
    #(import ./modules.nix)
    {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
      # nix-serve-ng = {
      #   url = "github:aristanetworks/nix-serve-ng";
      #   inputs.nixpkgs.follows = "nixpkgs";
      # };

      #nvf.url = "github:acup1/nvf";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      hyprland = {
        # type = "github";
        url = "github:hyprwm/Hyprland";
        # submodules = true;
        inputs.nixpkgs.follows = "nixpkgs";
      };
      hyprgrass = {
        url = "github:horriblename/hyprgrass";
        inputs.hyprland.follows = "hyprland";
      };
      # Hyprspace = {
      #   url = "github:KZDKM/Hyprspace";
      #   inputs.hyprland.follows = "hyprland";
      # };

      iio-hyprland.url = "github:JeanSchoeller/iio-hyprland";

      nix-matlab = {
        url = "gitlab:doronbehar/nix-matlab";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      dms = {
        url = "github:AvengeMedia/DankMaterialShell/stable";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      winapps = {
        url = "github:winapps-org/winapps";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      niri.url = "github:niri-wm/niri/wip/branch";

    };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      username = "acup";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [ ./programs/default.nix ]
          ++ (nixpkgs.lib.filesystem.listFilesRecursive ./configuration)
          ++ (inputs.nixpkgs.lib.filesystem.listFilesRecursive ./packages)
          ++ (nixpkgs.lib.filesystem.listFilesRecursive ./modules)
          # ++ [ inputs.niri.nixosModules.niri ]
        ;
        specialArgs = { inherit self inputs system username; };
      };

      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          # pkgs = nixpkgs.legacyPackages.${system};
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          # inputs.home-manager.nixosModules.home-manager
          modules = [ ./home.nix ];
          extraSpecialArgs = { inherit self inputs username system; };
        };
    };
}
