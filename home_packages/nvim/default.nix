{ pkgs
, config
, inputs
, ...
}:
let
  repo = builtins.fetchGit { url = "https://github.com/acup1/nvimcfg"; };
in
{
  home.packages = with pkgs; [
    neovide
  ];
  #xdg.configFile."nvim".source = "${repo.outPath}/";
  xdg.configFile."nvim".source = ./.config/nvimcfg;
}
