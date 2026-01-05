{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
    nerd-fonts.code-new-roman
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];
}
