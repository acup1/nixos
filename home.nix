{
  pkgs,
  inputs,
  username,
  host,
  system,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs username host system;};
    users.${username} = {
      imports =
        [
        ]
        ++ inputs.nixpkgs.lib.fileset.toList (
          inputs.nixpkgs.lib.fileset.fileFilter (file: file.name == "default.nix") ./home_packages
        );
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = ["${username}"];
}
