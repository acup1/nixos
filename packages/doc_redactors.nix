{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt6-fresh
    wpsoffice-cn
    texliveFull
    xournalpp
  ];
}
