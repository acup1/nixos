{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
    nerd-fonts.code-new-roman
    nerd-fonts.symbols-only
  ];

  fonts.fontconfig.enable = true;

  xdg.configFile."ghostty".source = ./.config/ghostty;
}
