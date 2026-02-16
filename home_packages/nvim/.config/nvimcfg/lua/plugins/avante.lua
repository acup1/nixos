-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    provider = "ollama",
    providers = {
      -- openai = {
      --   endpoint = "https://foundation-models.api.cloud.ru/v1",
      --   model = "openai/gpt-oss-120b",
      --   timeout = 30000, -- Timeout in milliseconds
      --   extra_request_body = {
      --     temperature = 0.75,
      --     max_tokens = 20480,
      --   },
      -- },
      ollama = {
        __inherited_from = "openai",
        api_key_name = "",
        model = "brnpistone/Qwen3-4B-AgentCoder-q6-k",
        endpoint = "http://192.168.0.2:11434/v1",
        -- is_env_set = require("avante.providers.ollama").check_endpoint_alive,
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

-- return {
--   {
--     "yetone/avante.nvim",
--     opts = {
--       provider = "ollama",
--
--       behaviour = {
--         auto_suggestions = false,
--         auto_set_highlight_group = true,
--         auto_set_keymaps = true,
--         auto_apply_diff_after_generation = false,
--         support_paste_from_clipboard = false,
--         minimize_diff = true,
--         enable_token_counting = true,
--         auto_add_current_file = true,
--         auto_approve_tool_permissions = true,
--         ---@type "popup" | "inline_buttons"
--         confirmation_ui_style = "inline_buttons",
--         --- Whether to automatically open files and navigate to lines when ACP agent makes edits
--         ---@type boolean
--         acp_follow_agent_locations = true,
--       },
--
--       providers = {
--         ollama = {
--           model = "qwen3:14b",
--           endpoint = "http://192.168.0.2:11434",
--           is_env_set = require("avante.providers.ollama").check_endpoint_alive,
--           extra_request_body = {
--             options = {
--               num_ctx = 32768,
--               temperature = 0,
--               keep_alive = "30m",
--             },
--           },
--         },
--       },
--     },
--   },
-- }

-- return {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   lazy = false,
--   version = false, -- set this if you want to always pull the latest change
--   opts = {
--     provider = "ollama",
--     vendors = {
--       ---@type AvanteProvider
--       ollama = {
--         ["local"] = true,
--         endpoint = "192.168.0.2:11434/v1",
--         model = "qwen3:14b",
--         parse_response_data = function(data_stream, event_state, opts)
--           require("avante.providers").copilot.parse_response(data_stream, event_state, opts)
--         end,
--         parse_curl_args = function(opts, code_opts)
--           return {
--             url = opts.endpoint .. "/chat/completions",
--             headers = {
--               ["Accept"] = "application/json",
--               ["Content-Type"] = "application/json",
--             },
--             body = {
--               model = opts.model,
--               messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
--               max_tokens = 2048,
--               stream = true,
--             },
--           }
--         end,
--       },
--     },
--   },
--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   build = "make",
--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--     "zbirenbaum/copilot.lua", -- for providers='copilot'
--     {
--       -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       "MeanderingProgrammer/render-markdown.nvim",
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }
