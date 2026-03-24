return {
	"stevearc/conform.nvim",
    opts = {

	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "ruff", "black", "autopep8", "isort" },
		htmldjango = { "djlint" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
		-- ["_"] = { "trim_whitespace" },
	},

	formatters = {
		djlint = {
			prepend_args = { "--preserve-blank-lines" },
		},
	},
    }
}