return {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = {
		"css",
		"eruby",
		"html",
		"htmldjango",
		"django",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"typescriptreact",
		"vue",
	},
	-- settings = {
	-- 	emmet = {
	-- 		showExpandedAbbreviation = "always",
	-- 		showAbbreviationSuggestions = true,
	-- 	},
	-- },

	init_options = {
		--- @type table<string, string>
		includeLanguages = {
			htmldjango = "html",
		},
		--- @type string[]
		excludeLanguages = {},
		--- @type string[]
		extensionsPath = {},
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
		preferences = {},
		--- @type boolean Defaults to `true`
		showAbbreviationSuggestions = true,
		--- @type "always" | "never" Defaults to `"always"`
		showExpandedAbbreviation = "always",
		--- @type boolean Defaults to `false`
		showSuggestionsAsSnippets = false,
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
		syntaxProfiles = {
			-- htmldjango = "html",
		},
		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
		variables = {},
	},
}
