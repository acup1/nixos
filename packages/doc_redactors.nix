{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    #docs
    typst

    #latex
    texliveFull

    #markdown
    obsidian
  ];
}
