{config, pkgs, ...}: {
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis-Grey-Dark-Compact";
    };
    gtk4.theme = config.gtk.theme;
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black";
    };
  };

  programs.dank-material-shell.settings.cursorSettings = {
    theme = config.home.pointerCursor.name;
    size = config.home.pointerCursor.size;
  };
}
