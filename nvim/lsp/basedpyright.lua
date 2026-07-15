return {
	settings = {
		basedpyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				-- typeCheckingMode = "all",
				typeCheckingMode = "standard", -- keep checking ON

				diagnosticSeverityOverrides = {
					-- error type: 'none', 'information', 'warning', 'erro'

					-- keep these on
					reportGeneralTypeIssues = "error",
					reportOptionalMemberAccess = "error",
					reportOptionalSubscript = "error",
					reportPrivateImportUsage = "warning",
					reportMissingTypeStubs = "warning",
					reportUnusedParameter = "hint",
					reportUnusedExpression = "information",
					reportUnannotatedClassAttribute = "information",
					reportImplicitOverride = "information",
					reportMissingImports = "error",
					reportSelfClsParameterName = "warning",

					-- ruff handles these
					reportUnusedImport = "none",
					reportUnusedVariable = "none",
					reportDuplicateImport = "none",
					reportUnusedFunction = "none",
					reportUnusedClass = "none",

					-- too much noise
					reportUnknownMemberType = "none",
					reportUnknownVariableType = "none",
					reportUnknownArgumentType = "none",
					reportUnknownParameterType = "none",
					reportAny = "none",
					reportExplicitAny = "none",
					reportMissingTypeArgument = "none",
					reportMissingParameterType = "none",
					reportUndefinedVariable = "none",
					reportUnknownLambdaType = "none",
					reportUnusedCallResult = "none",
				},
				inlayHints = {
					callArgumentNames = true,
				},
				exclude = {
					"**/node_modules",
					"**/__pycache__",
					"**/venv",
					"**/.venv",
					"**/.git",
				},
			},
			inlayHints = {
				variableTypes = true,
				parameterTypes = true,
				funcitonReturnTypes = true,
				callableReturnTypes = true,
				callableParameters = true,
				showParameterNames = false, -- set to true to also show param names
				typeWarnings = true, -- show type mismatch warnings inline
			},
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				ignore = { "*" },
			},
		},
		-- keys = {
		-- 	-- toggle inline type hints
		-- 	{
		-- 		"<leader>th",
		-- 		function()
		-- 			local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
		-- 			vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
		-- 		end,
		-- 		desc = "Toggle inlay hints",
		-- 	},
		-- 	-- on-demand type check (shows in floating window)
		-- 	{ "<leader>tl", vim.lsp.buf.hover, desc = "Show type info" },
		--
		-- 	-- function signature help (for calls under cursor)
		-- 	{ "<leader>tf", vim.lsp.buf.signature_help, desc = "Show function signature" },
		-- },
		-- init_options = {
		-- 	settings = {
		-- 		basedpyright = {
		-- 			-- optional: disable inlay hints for specific files/folders
		-- 			-- include = { "**/*.py" },
		-- 			-- exclude = { "**/test_*.py" },
		-- 		},
		-- 	},
		-- },
	},
}
