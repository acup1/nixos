{ pkgs
, config
, inputs
, ...
}:
let
  repo = builtins.fetchGit { url = "https://github.com/AstroNvim/AstroNvim"; };
in
{
  home.packages = with pkgs; [

  ];
  xdg.configFile."nvim".source = "${repo.outPath}/";
}
