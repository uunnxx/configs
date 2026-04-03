return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	lazy = true,
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "FelipeLema/cmp-async-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-cmdline" },
		{ "dcampos/cmp-snippy" },
		{ "dcampos/nvim-snippy" },
		{ "honza/vim-snippets" },
		{ "SergioRibera/cmp-dotenv" },
		{ "ray-x/cmp-sql", ft = { "py", "python", "sql" } },
		{ "vrslev/cmp-pypi", ft = "toml" },
		{ "hrsh7th/cmp-calc" },

		{ "onsails/lspkind.nvim" },
	},
}
