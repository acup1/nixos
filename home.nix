{ pkgs, inputs, username, host, system, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host system; };
    users.${username} = {
      imports = [ inputs.caelestia-shell.homeManagerModules.default ]
        ++ inputs.nixpkgs.lib.fileset.toList
        (inputs.nixpkgs.lib.fileset.fileFilter
          (file: file.name == "default.nix") ./home_packages);
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      home.packages = with pkgs; [ home-manager ];
      programs.home-manager.enable = true;

      programs.caelestia = {
        enable = true;
        systemd = {
          enable = false; # if you prefer starting from your compositor
          target = "graphical-session.target";
          environment = [ ];
        };
        settings = {
          bar.status = {
            showBattery = true;
            showKbLayout = true;
          };
          toast.enable = false;
        };
        cli = {
          enable = true; # Also add caelestia-cli to path
          settings = { theme.enableGtk = true; };
        };
      };

    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
