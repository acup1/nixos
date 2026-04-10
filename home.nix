{ pkgs, inputs, username, system, ... }: {
  # imports = [ inputs.home-manager.nixosmodules.home-manager ];

  # home-manager = {
  #   useuserpackages = true;
  #   useglobalpkgs = true;
  #   extraspecialargs = { inherit inputs username system; };
  #   users.${username} = {
  #     home.stateversion = "25.05";
  #
  #     imports = [ inputs.dms.homemodules.dank-material-shell ]
  #       ++ inputs.nixpkgs.lib.fileset.tolist
  #       (inputs.nixpkgs.lib.fileset.filefilter
  #         (file: file.name == "default.nix") ./home_packages);
  #
  #     home.homedirectory = "/home/${username}";
  #
  #     home.packages = with pkgs; [ home-manager ];
  #     programs.home-manager.enable = true;
  #     programs.dank-material-shell.enable = true;
  #   };
  # };


  home.stateVersion = "25.11";

  imports = [ inputs.dms.homeModules.dank-material-shell ]
    ++ inputs.nixpkgs.lib.fileset.toList
    (inputs.nixpkgs.lib.fileset.fileFilter (file: file.name == "default.nix")
      ./home_packages);

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [ home-manager ];
  # programs.home-manager.enable = true;
  programs.dank-material-shell.enable = true;
}
