{ common, buildFHSUserEnv }:
buildFHSUserEnv {
  name = "matlab";

  targetPkgs = pkgs: with pkgs; common.targetPkgs pkgs;

  runScript = "~/matlab/bin/matlab";
}
