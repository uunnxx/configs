return {

	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },

	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {},
	},

	-- lua-ls for neovim config
	{ "folke/neodev.nvim" },
}