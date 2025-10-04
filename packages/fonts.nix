{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    corefonts
    vistafonts
    nerd-fonts.code-new-roman
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];
}
