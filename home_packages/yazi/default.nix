{
  pkgs,
  config,
  inputs,
  ...
}: let
  yaziWithoutYa = pkgs.symlinkJoin {
    name = "yazi-no-ya";
    paths = [pkgs.yazi];
    postBuild = ''
      rm -f $out/bin/ya
    '';
  };
in {
  home.packages = [
    yaziWithoutYa
  ];
}
