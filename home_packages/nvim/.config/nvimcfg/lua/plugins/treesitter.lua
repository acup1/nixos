-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "javascript",
        "typescript",
        "bash",
        "json",
        "yaml",
        "html",
        "css",
        "c",
        "cpp",
        "go",
        "rust",
        "java",
        "kotlin",
        "markdown",
        "sql",
        "dockerfile",
        "make",
        "comment",
        -- добавьте другие нужные парсеры
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      -- Настройки textobjects
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup { textobjects = opts } end,
  },
}
