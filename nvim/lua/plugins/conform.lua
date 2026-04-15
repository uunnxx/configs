return {
	"stevearc/conform.nvim",
	opts = {

		formatters_by_ft = {
			lua = { "stylua" },
			-- python = { "ruff", "black", "autopep8", "isort", "autopep8" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "ruff", "autopep8", "isort", "black" }
				end
			end,
			htmldjango = { "djlint" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			yaml = { "yamlfmt", "yamlfix", "prettierd" },
			toml = { "tombi"},
			sh = { "beautysh" },
			["_"] = { "trim_whitespace" },
		},

		formatters = {
			djlint = {
				prepend_args = { "--preserve-blank-lines" },
			},
		},
		lsp_format = "fallback",
	},
}
