{ pkgs, config, inputs, ... }:
let
  # repo = builtins.fetchGit {url = "https://github.com/Diolinux/PhotoGIMP";};
in
{
  # home.packages = with pkgs; [ niri ];
  #xdg.configFile."waybar".source = ./.config/waybar;
  # xdg.configFile."GIMP".source = "${repo.outPath}/.config/GIMP";
}
