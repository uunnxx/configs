return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- downloads a prebuilt binary or falls back to cargo build
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		debug = {
			enabled = true,
			show_scores = false,
			show_file_info = {
				file_info = true, -- size, type, git status, frecency
				score_breakdown = false, -- total + match type, bonuses, modifiers, penalty
				-- modified + accessed timestamps; pass a table to hide individual rows:
				--   timings = { modified = false, accessed = true }
				timings = true,
				full_path = true, -- relative path at the bottom (wraps if too long)
			},
		},
		keymaps = {
			close = "<Esc>",
			select = "<CR>",
			select_split = "<C-s>",
			select_vsplit = "<C-v>",
			select_tab = "<C-t>",
			move_up = { "<S-Tab>", "<Up>" },
			move_down = { "<Tab>", "<Down>" },
			preview_scroll_up = { "<C-u>", "<S-Up>" },
			preview_scroll_down = { "<C-d>", "<S-Down>" },
			toggle_debug = "<F2>",
			cycle_grep_modes = "<S-Space>",
			-- grep mode only: jump cursor to first match of next/prev file group
			grep_jump_to_next_file = { "<C-A-n>", "<A-Down>" },
			grep_jump_to_prev_file = { "<C-A-p>", "<A-Up>" },
			cycle_previous_query = "<C-Up>",
			toggle_select = "<C-Space>",
			send_to_quickfix = "<C-q>",
			focus_list = "<leader>l",
			focus_preview = "<leader>p",
		},
		git = {
			status_text_color = false, -- true to color filenames by git status
		},
	},
	lazy = false, -- the plugin lazy-initialises itself
	keys = {
		{
			"tt",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		{
			"<M-f>",
			function()
				require("fff").live_grep()
			end,
			desc = "LiFFFe grep",
		},
		-- {
		-- 	"<M-f>",
		-- 	function()
		-- 		require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
		-- 	end,
		-- 	desc = "Live fffuzy grep",
		-- },
		{
			"<C-w>",
			function()
				require("fff").live_grep_under_cursor()
			end,
			mode = { "n", "x" },
			desc = "Search current word / selection",
		},
	},
}
