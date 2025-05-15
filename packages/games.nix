{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome-sudoku
  ];
}
