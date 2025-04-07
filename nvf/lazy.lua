require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{
			"horriblename/lzn-auto-require",
			config = function()
				require("lzn-auto-require").enable()
			end,
		},
		{ "mfussenegger/nvim-dap" },
		{ "rcarriga/nvim-dap-ui" },
	},
})
