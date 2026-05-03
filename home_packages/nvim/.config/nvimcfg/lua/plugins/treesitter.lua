-- -- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
--
-- ---@type LazySpec
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     -- In LazyVim or lazy.nvim, using 'opts' automatically calls the setup logic.
--     -- You don't need to manually require "nvim-treesitter.configs" anymore.
--     opts = {
--       ensure_installed = {
--         "lua",
--         "vim",
--         "python",
--         "javascript",
--         "typescript",
--         "bash",
--         "json",
--         "yaml",
--         "html",
--         "css",
--         "c",
--         "cpp",
--         "go",
--         "rust",
--         "java",
--         "kotlin",
--         "markdown",
--         "sql",
--         "dockerfile",
--         "make",
--         "comment",
--       },
--       highlight = { enable = true },
--       indent = { enable = true },
--     },
--     -- DELETE the config function that was here.
--     -- Lazy will now handle the opts correctly on its own.
--   },
--   {
--     "nvim-treesitter/nvim-treesitter-textobjects",
--     dependencies = { "nvim-treesitter/nvim-treesitter" },
--     -- This remains the same, as it hooks into the main treesitter config
--   },
-- }

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- 1. ОТКЛЮЧАЕМ автоматическую сборку, так как в NixOS всё уже собрано
    build = false,

    opts = {
      -- 2. ВАЖНО: Удаляем или комментируем ensure_installed.
      -- В NixOS парсеры ставятся через пакетный менеджер, а не через nvim-treesitter.
      ensure_installed = {},

      -- 3. Отключаем автоматическую установку
      auto_install = false,

      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- 4. Магия NixOS: добавляем путь к системным парсерам в runtimepath
      -- Это нужно, если Nix не прокинул их автоматически
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      -- Обычно NixOS кладет их в стандартные пути, но этот блок гарантирует работу
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
