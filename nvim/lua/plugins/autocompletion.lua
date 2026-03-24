return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "FelipeLema/cmp-async-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-cmdline" },
		{ "dcampos/nvim-snippy" },
		{ "dcampos/cmp-snippy" },
		{ "SergioRibera/cmp-dotenv" },
		{ "ray-x/cmp-sql" },
		{
			"vrslev/cmp-pypi",
			ft = "toml",
		},
		{ "hrsh7th/cmp-calc" },

		{ "onsails/lspkind.nvim" },
	},
}
