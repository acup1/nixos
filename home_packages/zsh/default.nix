{
  pkgs,
  username,
  flakeDir,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initContent = ''
      ${builtins.readFile ./.zshrc}
      alias nixrebuild="sudo darwin-rebuild switch --impure --flake ${flakeDir}"
      alias nixhomerebuild="home-manager switch --impure --flake ${flakeDir}#${username}"
      alias nixcleanup="sudo nix-collect-garbage -d"
      alias nixfullrebuild="nixrebuild && nixhomerebuild && nixcleanup"
      # ${pkgs.pokemon-colorscripts}/bin/pokemon-colorscripts -r -b
    '';
  };

  home.packages = with pkgs; [
    starship
    # pokemon-colorscripts
  ];
}
