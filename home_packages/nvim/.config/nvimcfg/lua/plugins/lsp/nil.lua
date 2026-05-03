return {
  {
    "AstroNvim/astrolsp",
    opts = {
      servers = { "nil_ls" },
      config = {
        nil_ls = {
          settings = {
            ["nil"] = {
              formatting = {
                command = { "alejandra" },
              },
            },
          },
        },
      },
    },
  },
}
