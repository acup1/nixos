-- Remove this line to activate the file
-- if true then return {} end

---@type LazySpec
return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup {
        strategies = {
          chat = {
            adapter = "ollama", -- Explicitly set Ollama as the adapter for chat
          },
          inline = {
            adapter = "ollama", -- Explicitly set Ollama for inline completion
          },
          agent = {
            adapter = "ollama", -- Explicitly set Ollama for agent tasks
          },
        },
        adapters = {
          http = {
            ollama = function()
              return require("codecompanion.adapters").extend("ollama", {
                name = "ollama", -- Explicitly name the adapter
                schema = {
                  model = {
                    default = "qwen2.5-coder:14b", -- Ensure this matches your pulled model
                  },
                },
                env = {
                  url = "http://127.0.0.1:11434", -- Local Ollama server URL
                },
                headers = {
                  ["Content-Type"] = "application/json",
                },
                parameters = {
                  sync = true, -- Synchronous requests
                },
              })
            end,
            opts = {
              log_level = "TRACE", -- Use TRACE for detailed debugging
            },
          },
        },
      }
    end,
  },
}
