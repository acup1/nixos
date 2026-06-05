{
  pkgs,
  inputs,
  username,
  system,
  ...
}: {
  home.stateVersion = "26.05";

  imports =
    []
    ++ inputs.nixpkgs.lib.fileset.toList
    (inputs.nixpkgs.lib.fileset.fileFilter (file: file.name == "default.nix")
      ./home_packages);

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.packages = with pkgs; [home-manager];
  # programs.home-manager.enable = true;
}
