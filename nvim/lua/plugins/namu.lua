return {
	"bassamsdata/namu.nvim",
	opts = {
		global = {},
		namu_symbols = { -- Specific Module options
			options = {
				AllowKinds = {
					default = {
						"Function",
						"Method",
						"Class",
						"Module",
						"Property",
						"Variable",
						"Constant",
						"Enum",
						"Interface",
						"Field",
						"Struct",
					},
					go = {
						"Function",
						"Method",
						"Struct", -- For struct definitions
						"Field", -- For struct fields
						"Interface",
						"Constant",
						-- "Variable",
						"Property",
						-- "TypeParameter", -- For type parameters if using generics
					},
					lua = { "Function", "Method", "Table", "Module" },
					python = { "Function", "Class", "Method" },
					-- Filetype specific
					yaml = { "Object", "Array" },
					json = { "Module" },
					toml = { "Object" },
					markdown = { "String" },
				},

				display = {
					format = "tree_guides",
				},
				movement = {
					next = { "<Tab>", "<DOWN>" }, -- Support multiple keys
					previous = { "<S-Tab>", "<UP>" }, -- Support multiple keys
					close = { "<ESC>" }, -- close mapping
					select = { "<CR>" }, -- select mapping
					delete_word = {}, -- delete word mapping
					clear_line = {}, -- clear line mapping
				},
				multiselect = {
					enabled = false,
					indicator = "●", -- or "✓"◉
					keymaps = {
						toggle = "<C-n>",
						untoggle = "<C-p>",
						select_all = "<C-a>",
						clear_all = "<C-l>",
					},
					max_items = nil, -- No limit by default
				},
				custom_keymaps = {
					yank = {
						keys = { "<C-t>" }, -- yank symbol text
					},
					delete = {
						keys = { "<C-d>" }, -- delete symbol text
					},
					vertical_split = {
						keys = { "<C-v>" }, -- open in vertical split
					},
					horizontal_split = {
						keys = { "<C-h>" }, -- open in horizontal split
					},
					-- codecompanion = {
					-- 	keys = "<C-o>", -- Add symbols to CodeCompanion
					-- },
					-- avante = {
					-- 	keys = "<C-t>", -- Add symbol to Avante
					-- },
				},
			},
		},
	},

	-- === Suggested Keymaps: ===
	vim.keymap.set("n", "<C-t>", ":Namu symbols<cr>", {
		desc = "Jump to LSP symbol",
		silent = true,
	}),
	-- vim.keymap.set("n", "<leader>sw", ":Namu workspace<cr>", {
	-- 	desc = "LSP Symbols - Workspace",
	-- 	silent = true,
	-- }),
}
