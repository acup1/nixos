{pkgs, ...}: {
  home.packages = with pkgs; [
    neovide
    nil
    alejandra
  ];
}
