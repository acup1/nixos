-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- LSP серверы
        "clangd", -- C/C++
        "lua-language-server", -- Lua
        "python-lsp-server", -- Python
        "omnisharp", -- C#
        "bash-language-server", -- Bash
        "html-lsp", -- HTML
        "rnix-lsp", -- Nix
        "hyprls", -- Hyprland

        -- Форматтеры
        "clang-format", -- C/C++
        "stylua", -- Lua
        "beautysh", -- Bash
        "shfmt", -- Shell
        "nixfmt", -- Nix
        "nixpkgs-fmt", -- Nix
        "biome", -- JavaScript/TypeScript
        "ruff", -- Python

        -- Линтеры
        "selene", -- Lua
        "htmlhint", -- HTML

        -- Другие инструменты
        "debugpy", -- Python debugger
        "tree-sitter-cli", -- Tree-sitter CLI
        "mbake", -- (добавлен по вашему списку)
      },
    },
  },
}
