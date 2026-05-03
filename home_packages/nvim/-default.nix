{
  pkgs,
  config,
  inputs,
  ...
}: let
  repo = builtins.fetchGit {url = "https://github.com/acup1/nvimcfg";};
in {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (
        p:
          with p; [
            lua
            vim
            python
            javascript
            typescript
            bash
            json
            yaml
            html
            css
            c
            cpp
            go
            rust
            java
            kotlin
            markdown
            sql
            dockerfile
            make
          ]
      ))
      nvim-treesitter-textobjects
    ];
  };
  home.packages = with pkgs; [
    neovide
    nil
    alejandra
  ];
  #xdg.configFile."nvim".source = "${repo.outPath}/";
  xdg.configFile."nvim" = {
    source = ./.config/nvimcfg;
    # Это заставит Home Manager копировать файлы по отдельности,
    # а не создавать одну ссылку на всю папку
    recursive = true;
  };
}
