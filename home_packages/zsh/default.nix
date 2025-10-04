{ pkgs, config, inputs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion =
      false; # Disable default completion to avoid conflicts with zsh-autocomplete

    plugins = [{
      name = "zsh-autocomplete";
      src = pkgs.fetchFromGitHub {
        owner = "marlonrichert";
        repo = "zsh-autocomplete";
        rev = "762afacbf227ecd173e899d10a28a478b4c84a3f";
        sha256 = "1357hygrjwj5vd4cjdvxzrx967f1d2dbqm2rskbz5z1q6jri1hm3";
      };
    }];

    initContent = ''
      ${builtins.readFile ./.zshrc}
    '';
  };

  home.packages = with pkgs; [ starship ];
}
