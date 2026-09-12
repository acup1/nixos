{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    #docs
    libreoffice-qt-stable
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
