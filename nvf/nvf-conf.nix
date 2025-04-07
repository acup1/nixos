{
  pkgs,
  lib,
  ...
}: {
  vim = {
    lazy.enable = true;
    lazy.enableLznAutoRequire = false;
    lazy.plugins = {
      "LazyVim" = {
        package = pkgs.vimPlugins.LazyVim;
        setupModule = "lazyvim";

        after = builtins.readFile ./lazy.lua;
      };
    };
    filetree.neo-tree.enable = true;
    theme = {
      enable = true;
      name = "onedark";
      style = "dark";
    };
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      clang.enable = true;
      lua.enable = true;
    };
  };
}
