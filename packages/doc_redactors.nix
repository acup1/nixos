{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #docs
    libreoffice-qt6-fresh
    wpsoffice-cn
    typst

    #latex
    texliveFull

    #pdf
    xournalpp
    pdfarranger
    zathura

    #markdown
    obsidian
  ];
}
