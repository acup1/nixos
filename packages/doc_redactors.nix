{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #docs
    libreoffice-qt6-fresh
    #wpsoffice-cn

    #latex
    texliveFull

    #pdf
    xournalpp
    pdfarranger

    #markdown
    obsidian
  ];
}
