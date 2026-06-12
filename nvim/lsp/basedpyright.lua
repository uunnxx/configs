return {
	settings = {
		basedpyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "all",
				diagnosticSeverityOverrides = {
					reportAny = false,
					reportExplicitAny = false,
					reportMissingTypeArgument = false,
					reportMissingParameterType = false,
					reportMissingTypeStubs = false,
					reportUnknownArgumentType = false,
					reportUnknownMemberType = false,
					reportUnknownParameterType = false,
					reportUnknownVariableType = false,
					reportUnknownLambdaType = false,
					reportUnusedCallResult = false,
					reportUnusedVariable = false,
					reportUnusedParameter = true,
					reportUnusedImport = false,
					reportUnannotatedClassAttribute = false,
					reportImplicitOverride = false,
				},
				inlayHints = {
					callArgumentNames = true,
				},
			},
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				ignore = { "*" },
			},
		},
	},
}
