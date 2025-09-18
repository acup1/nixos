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

  ];
  #xdg.configFile."nvim".source = "${repo.outPath}/";
  xdg.configFile."nvim".source = ./nvimcfg;
}
