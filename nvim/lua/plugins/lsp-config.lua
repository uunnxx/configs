return {

	{ "neovim/nvim-lspconfig" },

	{ "mason-org/mason.nvim", opts = {} },

	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {},
	},

	-- lua-ls for neovim config
	{ "folke/neodev.nvim" },
}
