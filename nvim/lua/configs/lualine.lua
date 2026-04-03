-- Custom components
local function wordCount()
	local filetype = vim.bo.filetype
	if filetype == "md" or filetype == "txt" or filetype == "markdown" or filetype == "lsp_markdown" then
		if vim.fn.wordcount().visual_words == 1 then
			return tostring(vim.fn.wordcount().visual_words) .. " word"
		elseif not (vim.fn.wordcount().visual_words == nil) then
			return tostring(vim.fn.wordcount().visual_words) .. " words"
		else
			return tostring(vim.fn.wordcount().words) .. " words"
		end
	else
		return ""
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
		-- fmt = string.lower,
		component_separators = { left = "|", right = "|" },
		section_separators = { left = " ", right = " " },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16,
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "searchcount", "selectioncount" },
		-- lualine_c = { "getcwd", "filename", "filesize" },
		lualine_c = { "filename" },

		lualine_x = {
			-- {
			-- 	function()
			-- 		local ok, muslim = pcall(require, "muslim")
			-- 		if ok and muslim.prayer_time then
			-- 			return muslim.prayer_time()
			-- 		end
			-- 		return ""
			-- 	end,
			-- 	id = "muslim.nvim",
			-- 	color = { fg = "#83a598", bg = "#282828", gui = "bold" }, -- for style check [:h attr-list]
			-- },
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
				},
				-- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				colored = true,
				update_in_insert = false,
				always_visible = false,
			},
			"encoding",
			"fileformat",
			"filetype",
			wordCount,
		},
		-- %B hex code
		lualine_y = { "%B", "progress", "location" },
		-- lualine_z = { "hostname" },
		lualine_z = { "lsp_status" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {
		"quickfix",
		-- "fzf",
		-- "lazy",
		-- "man",
		-- "trouble",
	},
})
