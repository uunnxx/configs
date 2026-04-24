return {
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "nvim-tree/nvim-web-devicons" },

	-- :Align
	{ "RRethy/nvim-align" },

	-- switch and restore fcitx state
	{ "h-hg/fcitx.nvim", lazy = false },

	-- Tagbar
	{ "majutsushi/tagbar", lazy = true },
	-- CamelCaseMotion alternative
	{ "chaoren/vim-wordmotion" }, -- commented because of neovim slow performance
	-- Autopair alternative
	-- 'cohama/lexima.vim',

	{ -- configure it with `cmp` and `lsp`
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		lazy = false,
	},

	{ "tpope/vim-unimpaired" },
	-- {'Chiel92/vim-autoformat'},
	-- {'tpope/vim-surround'},
	-- {'tpope/vim-repeat'},
	-- Auto close (x)html tags
	-- { 'alvan/vim-closetag', ft = {'html', 'html5', 'htmldjango', 'xhtml', 'xml'} },
	-- {'AndrewRadev/tagalong.vim'}
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
	},
}
