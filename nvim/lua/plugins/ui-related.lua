return {
	{ "m-demare/hlargs.nvim" }, -- Highlight arguments' definitions and usages, asynchronously, using Treesitter
	{ "tzachar/local-highlight.nvim", opts = {} },
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy" },
	{
		-- Simple winbar/statusline plugin that shows your current code context
		"SmiteshP/nvim-navic",
	},

	{ "akinsho/bufferline.nvim" },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},
}
