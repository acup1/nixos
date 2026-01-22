{ pkgs, inputs, username, host, system, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host system; };
    users.${username} = {
      imports = [
        inputs.caelestia-shell.homeManagerModules.default
        inputs.dms.homeModules.dank-material-shell
      ] ++ inputs.nixpkgs.lib.fileset.toList
        (inputs.nixpkgs.lib.fileset.fileFilter
          (file: file.name == "default.nix") ./home_packages);
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      home.packages = with pkgs; [ home-manager ];
      programs.home-manager.enable = true;

      programs.dank-material-shell.enable = true;

      # services.wvkbd = {
      #   enable = true;
      #   package = pkgs.wvkbd;
      # };

    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups =
      [ "networkmanager" "wheel" "docker" "plugdev" "dialout" "lp" "lpadmin" ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
