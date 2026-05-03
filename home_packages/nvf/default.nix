{
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (inputs.nvf.lib.nvim.dag) entryAnywhere entryAfter;
in {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme = {
        enable = true;
        name = "onedark";
        style = "darker";
        transparent = true;
      };
      ui.borders.enable = true;

      luaConfigRC.mini-comment = entryAnywhere ''
        require("mini.comment").setup({
          mappings = {
            comment = "<leader>/",
            comment_line = "<leader>/",
            comment_visual = "<leader>/",
            textobject = "<leader>/",
          },
        })
      '';
      startPlugins = [pkgs.vimPlugins.mini-nvim];
      options = {
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        softtabstop = 2;
      };
      dashboard.alpha.enable = true;
      luaConfigRC.alpha-custom = entryAnywhere ''
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡀⠀⠀⡐⡕⡱⡀⠀⡌⡎⡲⡠⠀⡀⡆⡇⢆⠀⠀⠀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢜⢌⢎⠤⡐⡜⡜⢜⠜⡜⡌⡎⡪⡪⡊⡎⡜⢜⠬⡠⡢⡱⣑⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⢜⢔⢄⢄⢕⢅⢇⠇⡇⢇⢎⢎⢎⢎⢪⢸⢨⢢⢣⢃⢇⢇⠇⡇⡎⢎⢆⢎⢄⢔⢔⢕⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢐⢅⢇⢕⢕⢅⢇⢕⢕⢕⠕⡕⡱⡸⡨⡪⢪⢊⢎⢪⢊⢎⢆⢇⢇⢎⢎⢎⢜⢌⢆⢇⢎⠂⠀⢀⢀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢄⢆⠅⠀⠀⢀⡀⠀",
                "⠀⠀⡀⡄⠀⠨⢪⢒⢄⡀⠀⠀⠀⠀⠀⠀⠀⠨⡪⡪⢪⢢⠣⡣⡱⡸⡰⡱⡡⡣⡪⡪⢪⢊⢎⢜⢜⠜⡜⢜⢜⢸⢰⢱⢸⢰⢱⢡⢣⢱⢑⢕⢅⢇⢕⢕⢕⢱⠁⠀⠀⠀⠀⠀⢠⠸⡨⡢⡣⠁⠀⠀⡢⣒⠀",
                "⠀⢔⢕⢜⠀⠀⢕⠕⡕⢜⢄⠀⠀⠀⠀⠀⠀⠈⡢⡣⢣⢃⢇⢇⢣⢱⢱⢸⢨⢪⠢⡣⡣⢣⢣⢱⢸⠸⡸⡘⡌⡎⡪⡢⡣⡱⡡⡣⡱⡑⡕⡅⡇⡕⢕⢅⢇⢕⠁⠀⠀⠀⠀⢐⢜⢜⠜⡜⠬⠀⢀⢰⢑⢆⡃",
                "⠨⡪⡢⡣⡣⡀⢕⢕⢕⠕⡕⡄⠀⠀⡪⡪⡊⡎⢆⢇⢇⢇⢕⢕⢱⢑⢕⢜⢌⢆⢇⢇⢎⢎⢪⢸⢘⢜⠜⡜⢜⢜⢸⢨⢪⢸⢨⠪⡊⡎⡪⡸⡨⡪⡪⡪⡸⡰⡱⡱⡑⡕⠀⢪⢢⠣⡣⡣⢫⢐⢜⠜⡜⡔⠀",
                "⠈⢪⢢⢣⢪⠪⡢⢣⠪⡪⡪⡂⠀⠀⠐⡱⡡⡣⡣⢣⢪⢢⢣⢱⠱⡑⡕⡅⡇⡣⡱⡑⡅⡇⢇⢣⠣⡃⡇⢇⢇⢕⢕⢱⢡⢣⢱⢱⢱⠱⡑⡕⢕⢱⢸⢨⢪⢸⢰⢑⢕⠁⠀⠐⢕⠕⡕⡜⡜⢜⠜⡜⡌⠂⠀",
                "⠀⠀⠑⡕⡜⢜⢜⢜⢜⢌⠖⠠⡐⡔⡔⡜⡌⡆⡇⡇⡣⡱⡡⡣⡣⡣⡣⡱⡑⡕⢕⠕⡕⢕⢕⢕⢕⢕⢕⠕⡕⡅⡇⡣⡱⡑⡕⡅⡇⡣⡣⡣⡣⡣⢣⢱⢑⢅⢇⢣⢕⢔⢔⢄⠅⡣⡣⡱⡸⡸⡸⠈⠀⠀⠀",
                "⠀⠀⠀⠀⠘⠘⢔⢕⢜⠬⡀⠈⢎⢪⢸⢰⠱⡑⡕⡜⡜⢜⢌⢎⢆⢇⢎⢪⠪⡪⡪⣪⣾⣆⠀⠁⠪⡢⡣⢣⠣⡪⢪⣾⣆⠈⠈⢎⢜⢜⢌⢆⢇⢎⢎⢎⢪⠪⡪⡊⡆⡇⡕⢥⢑⢜⢌⢎⠊⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠱⡡⡣⡣⡒⡄⡇⡣⡱⡱⡱⡑⡕⡜⡜⢜⢔⢕⢜⢜⢸⢸⢨⠢⠹⣿⡿⠀⠀⠀⢕⢜⢜⢜⠌⠸⣿⡟⠀⠀⠨⡪⡢⡣⡱⡡⡣⡱⡸⡸⡸⡘⡌⡎⡪⡸⡸⡘⡌⠎⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢜⠜⡌⡎⢎⢪⢪⢸⢘⢌⢎⢪⢪⢢⢣⢱⢸⠸⡰⡱⡡⠀⠀⠀⠀⠀⠀⢜⢌⢆⢇⠆⠀⠀⠀⠀⠀⢐⢜⢔⢕⢱⢑⢕⢱⠱⡸⡨⡪⡪⢪⠪⡊⡎⡪⢌⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⢀⢔⢕⠕⡕⢕⠕⡱⡑⡅⡇⢇⢣⢣⢱⢸⢨⢪⢢⢣⢣⢱⢸⢰⢀⡀⡀⡠⡸⡘⡜⡌⡖⢍⢆⡀⣀⢠⢰⢸⢰⢑⢕⢱⢑⢕⠕⡕⢕⢱⠱⠸⡘⠜⢜⠜⡜⡌⡇⡕⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠐⢕⢜⢜⢜⢌⠐⠔⡐⡡⢊⢑⠕⡱⢑⢅⢇⢕⢅⢇⢕⢕⢱⢑⢕⢜⢜⠜⣌⠊⠊⠘⠈⠊⡢⡣⡱⡑⡅⡇⡎⢎⢪⠪⡪⢢⠣⢃⠣⠑⠌⠌⡐⠅⠅⡣⡣⡱⡑⠕⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠆⡇⡎⡪⡄⠈⠔⡐⡀⠀⠈⠀⠑⠐⠡⡡⠑⢅⠣⡑⢕⠱⡡⢣⠪⡪⢢⢣⢢⢠⢰⠸⡘⡌⢎⠪⡊⡊⡊⡪⢘⠨⠂⠅⠊⠀⠁⠀⠀⡐⠌⠌⢐⢜⢌⢎⠊⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢎⢪⢪⢡⠀⠂⡊⠄⠀⠀⠀⠀⠀⠀⠈⠀⠈⠀⠂⠁⠈⠂⠁⠈⠂⠂⠂⠂⠂⠑⠈⠐⠁⠊⠐⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⠌⠂⠠⡪⢪⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠱⡑⡕⡀⠀⠑⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠌⠀⠠⡸⡸⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠊⡎⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢜⠌⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠪⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
        }

        -- -- Кнопки меню
        -- dashboard.section.buttons.val = {
        --   dashboard.button("f", "  Найти файл",    ":Telescope find_files<CR>"),
        --   dashboard.button("r", "  Недавние файлы", ":Telescope oldfiles<CR>"),
        --   dashboard.button("g", "  Поиск текста",  ":Telescope live_grep<CR>"),
        --   dashboard.button("n", "  Новый файл",    ":ene <BAR> startinsert<CR>"),
        --   dashboard.button("q", "  Выйти",         ":qa<CR>"),
        -- }

        -- Футер
        dashboard.section.footer.val = "Crab worlD"
        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"

        local function set_alpha_colors()
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#e63a00" })
        vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#a63a00" })
        end

        -- Применяем сразу и при каждой смене темы
        set_alpha_colors()
        vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_alpha_colors,
        })

        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        alpha.setup(dashboard.opts)
      '';
      luaConfigRC.rounded-borders = entryAnywhere ''
        -- LSP окна (hover, diagnostics)
        vim.lsp.handlers["textDocument/hover"] =
          vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

        vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

        vim.diagnostic.config({
          float = { border = "rounded" },
        })

        -- Все floating окна по умолчанию
        local orig_open_win = vim.api.nvim_open_win
        vim.api.nvim_open_win = function(buf, enter, opts)
          if opts.relative and opts.relative ~= "" and not opts.border then
            opts.border = "rounded"
          end
          return orig_open_win(buf, enter, opts)
        end
      '';
      luaConfigRC.toggleterm-borders = entryAnywhere ''
        require("toggleterm").setup({
          float_opts = {
            border = "rounded",
          },
        })
      '';

      extraPlugins = {
        nvim-colorizer = {
          package = pkgs.vimPlugins.nvim-colorizer-lua;
        };
        render-markdown = {
          package = pkgs.vimPlugins.render-markdown-nvim;
          setup = ''
            require('render-markdown').setup({})
          '';
        };
        image-nvim = {
          package = pkgs.vimPlugins.image-nvim;
          setup = ''
            require('image').setup({
              backend = "kitty", -- или "ueberzug", "sixel"
              integrations = {
                markdown = {
                  enabled = true,
                  clear_in_insert_mode = false,
                  download_remote_images = true,
                  only_render_image_at_cursor = false,
                },
              },
              max_width = 100,
              max_height = 20,
            })
          '';
        };
      };

      luaConfigRC.colorizer = ''
        require("colorizer").setup({
          filetypes = { "*" },
          user_default_options = {
            RGB      = true,
            RRGGBB   = true,
            names    = true,
            RRGGBBAA = true,
            rgb_fn   = true,
            hsl_fn   = true,
            css      = true,
            css_fn   = true,
            mode     = "background", -- "foreground" or "virtualtext"
          },
        })
      '';

      extraPackages = with pkgs; [
        wl-clipboard
        imagemagick
      ];
      binds = {
        whichKey.enable = true;
      };

      terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };

      filetree.neo-tree = {
        enable = true;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
      };

      statusline.lualine = {
        enable = true;
        # theme = "tokyonight";
      };
      # luaConfigRC.lualine-custom = entryAfter ["lualine"] ''
      #   require("lualine").setup({
      #     options = {
      #       theme = "tokyonight",
      #       component_separators = { left = "+", right = "+" },
      #       section_separators   = { left = "+", right = "+" },
      #     },
      #   })
      # '';

      tabline = {
        nvimBufferline.enable = true;
      };
      telescope.enable = true;
      lsp = {
        enable = true;
        formatOnSave = true;
        lspconfig.enable = true;
        lspSignature.enable = true;
      };

      autocomplete.nvim-cmp.enable = true;

      languages = {
        nix = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          treesitter.enable = true;
          # format.type = "alejandra";
        };
        markdown = {
          enable = true;
          treesitter.enable = true;
        };
        python = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          treesitter.enable = true;
          # format.type = "black"; # или "ruff"
        };
        lua = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          treesitter.enable = true;
        };
        sql = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          treesitter.enable = true;
        };
        rust = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          treesitter.enable = true;
        };
        clang = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
          #format.enable = true;
        };
        bash = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
          format.enable = true;
        };
      };

      keymaps = [
        {
          key = "<Esc>";
          mode = "n";
          action = "<cmd>nohlsearch<CR>";
          silent = true;
          desc = "Снять подсветку поиска";
        }
        {
          # Открыть/закрыть дерево
          key = "<leader>e";
          mode = "n";
          action = "<cmd>Neotree toggle<CR>";
          silent = true;
          desc = "Toggle file tree";
        }
        {
          key = "<leader>c";
          mode = "n";
          action = "<cmd>Bdelete<CR>";
          silent = true;
          desc = "Close buffer";
        }
        # Отключаем Cmd+Space во всех режимах
        {
          key = "<D-Space>";
          mode = "n";
          action = "<Nop>";
          noremap = true;
        }
        {
          key = "<D-Space>";
          mode = "v";
          action = "<Nop>";
          noremap = true;
        }
        {
          key = "<D-Space>";
          mode = "i";
          action = "<Nop>";
          noremap = true;
        }

        # Tab — следующий буфер, Shift+Tab — предыдущий
        {
          key = "<Tab>";
          mode = "n";
          action = "<cmd>bnext<CR>";
          silent = true;
          desc = "Следующий буфер";
        }
        {
          key = "<S-Tab>";
          mode = "n";
          action = "<cmd>bprevious<CR>";
          silent = true;
          desc = "Предыдущий буфер";
        }
        # Плавающий терминал
        {
          key = "<leader>tf";
          mode = "n";
          action = "<cmd>ToggleTerm direction=float<CR>";
          silent = true;
          desc = "Плавающий терминал";
        }
        # Горизонтальный снизу
        {
          key = "<leader>th";
          mode = "n";
          action = "<cmd>ToggleTerm direction=horizontal<CR>";
          silent = true;
          desc = "Горизонтальный терминал";
        }
        # Вертикальный справа
        {
          key = "<leader>tv";
          mode = "n";
          action = "<cmd>ToggleTerm direction=vertical<CR>";
          silent = true;
          desc = "Вертикальный терминал";
        }
        {
          key = "<C-'>";
          mode = ["n" "i" "v" "t"];
          action = "<cmd>ToggleTerm<CR>";
          silent = true;
          desc = "toggle terminal";
        }
        # Закрыть терминал по Esc (внутри терминального режима)
        {
          key = "<Esc>";
          mode = "t";
          action = "<C-\\><C-n>";
          silent = true;
          desc = "Выйти из терминального режима";
        }
        {
          key = "<C-s>";
          mode = ["n" "i" "v"];
          action = "<cmd>w<CR>";
          silent = true;
          desc = "Сохранить файл";
        }
        # Изменение размера сплитов
        {
          key = "<C-Up>";
          mode = "n";
          action = "<cmd>resize +2<CR>";
          silent = true;
          desc = "Увеличить высоту";
        }
        {
          key = "<C-Down>";
          mode = "n";
          action = "<cmd>resize -2<CR>";
          silent = true;
          desc = "Уменьшить высоту";
        }
        {
          key = "<C-Left>";
          mode = "n";
          action = "<cmd>vertical resize -2<CR>";
          silent = true;
          desc = "Уменьшить ширину";
        }
        {
          key = "<C-Right>";
          mode = "n";
          action = "<cmd>vertical resize +2<CR>";
          silent = true;
          desc = "Увеличить ширину";
        }
      ];
    };
  };
}
