{
  pkgs,
  config,
  inputs,
  ...
}: let
  repo = builtins.fetchGit {url = "https://github.com/Anik200/dotfiles";};
in {
  home.packages = with pkgs; [
    waybar
  ];
  #xdg.configFile."waybar".source = ./.config/waybar;
  xdg.configFile."waybar".source = "${repo.outPath}/.config/waybar";
}
