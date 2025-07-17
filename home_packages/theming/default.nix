{
  pkgs,
  config,
  inputs,
  ...
}: {
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis-Grey-Dark-Compact";
    };
    iconTheme = {
      package = pkgs.kora-icon-theme;
      name = "Kora";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 22;
  };
}
