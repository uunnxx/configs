return {
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "nvim-tree/nvim-web-devicons" },
	{ -- Use `gx` to open github related links as "user/git_repo"
		"gabebw/vim-github-link-opener",
		branch = "main",
	},

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
}
