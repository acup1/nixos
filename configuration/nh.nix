{ flakeDir, ... }:

{
  programs.nh = {
    enable = true;
    flake = flakeDir;
  };
}
