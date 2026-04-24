return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		indent = { enabled = true },
		quickfile = { enabled = true },
		explorer = { enabled = false },
		dashboard = { enabled = true },
		bigfile = { enabled = true },
		scroll = { enabled = true },
		picker = {
			sources = {
				buffers = {
					layout = {
						-- preview = false,
					},
				},
				explorer = {
					layout = {
						layout = {
							-- width = 0.12,
							width = function()
								return math.max(20, math.floor(vim.o.columns * 0.15))
							end,
						},
					},
					win = {
						list = {
							keys = {
								["<Tab>"] = "list_down",
								["<S-Tab>"] = "list_up",
								["s"] = "select_and_next",
								["<C-n>"] = "cancel",
							},
						},
					},
				},
			},
			win = {
				input = {
					keys = {
						-- Remap Tab to move down (instead of select_and_next)
						["<Tab>"] = { "list_down", mode = { "i", "n" } },
						-- Remap Shift-Tab to move up (instead of select_and_prev)
						["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
						-- Remap Space to toggle selection
						-- ["<C-Space>"] = { "select_and_next", mode = { "i", "n" } },
						-- ["<S-Space>"] = { "select_and_prev", mode = { "i", "n" } },

						["/"] = "toggle_focus",
						["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
						["<C-Up>"] = { "history_back", mode = { "i", "n" } },
						["<C-c>"] = { "cancel", mode = "i" },
						["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
						["<CR>"] = { "confirm", mode = { "n", "i" } },
						-- ["<Esc>"] = "cancel",
						["<Esc>"] = { "close", mode = { "n", "i" } },
						["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
						["<a-d>"] = { "inspect", mode = { "n", "i" } },
						["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
						["<S-h>"] = { "toggle_hidden", mode = { "i", "n" } },
						["<S-i>"] = { "toggle_ignored", mode = { "i", "n" } },
						["<a-r>"] = { "toggle_regex", mode = { "i", "n" } },
						["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
						["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
						["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
						["<C-a>"] = { "select_all", mode = { "n", "i" } },
						["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
						["<C-Space>"] = { "preview_scroll_down", mode = { "i", "n" } },
						-- ["<C-u>"] = { "list_scroll_up", mode = { "i", "n" } },
						-- ["<C-d>"] = { "list_scroll_down", mode = { "i", "n" } },
						["<C-g>"] = { "toggle_live", mode = { "i", "n" } },
						["<C-q>"] = { "qflist", mode = { "i", "n" } },
						["<C-t>"] = { "tab", mode = { "n", "i" } },
						["<C-v>"] = { "edit_vsplit", mode = { "i", "n" } },
						["<C-h>"] = { "edit_split", mode = { "i", "n" } },
						["<C-r>#"] = { "insert_alt", mode = "i" },
						["<C-r>%"] = { "insert_filename", mode = "i" },
						["<C-r><c-a>"] = { "insert_cWORD", mode = "i" },
						["<C-r><c-f>"] = { "insert_file", mode = "i" },
						["<C-r><c-l>"] = { "insert_line", mode = "i" },
						["<C-r><c-p>"] = { "insert_file_full", mode = "i" },
						["<C-r><c-w>"] = { "insert_cword", mode = "i" },
						["<C-w>H"] = "layout_left",
						["<C-w>J"] = "layout_bottom",
						["<C-w>K"] = "layout_top",
						["<C-w>L"] = "layout_right",
						["?"] = "toggle_help_input",
						["gg"] = "list_top",
						["G"] = "list_bottom",
						["q"] = "cancel",
					},
				},
			},
		},
		input = { enabled = true },
		scope = { enabled = true },
		words = { enabled = true },
		statuscolumn = { enabled = true },

		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},
	keys = {},
}
