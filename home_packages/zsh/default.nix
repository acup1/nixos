{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.file = {
    ".zshrc".source = ./.zshrc;
    ".oh-my-zsh".source = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
    #".oh-my-zsh/themes/acup.zsh-theme".source = ./acup.zsh-theme;
  };
}
