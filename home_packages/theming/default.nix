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
  };
}
