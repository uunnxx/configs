local M = {}

-------------------------------------------------------------------------------
--- Commands
M.commands = {
	{
		name = "Recent",
		action = ":lua Snacks.picker.recent()",
		keys = "",
	},
	{
		name = "Explorer",
		action = ":lua Snacks.explorer()",
		keys = "<C-n>",
	},
	{
		name = "Find Files [smart]",
		action = ":lua Snacks.picker.smart()",
		keys = "tt",
	},
	{
		name = "Find Files",
		action = ":lua Snacks.picker.files()",
		keys = "<S-CR>",
	},
	{
		name = "Find Config Files",
		action = ":lua Snacks.picker.files({cwd=vim.fn.stdpath('config')})",
		keys = "",
	},
	{
		name = "Find Git Files",
		action = ":lua Snacks.picker.git_files()",
		keys = "",
	},
	{
		name = "Projects",
		action = ":lua Snacks.picker.projects()",
		keys = "",
	},
	{
		name = "Buffers",
		action = ":lua Snacks.picker.buffers()",
		keys = "<C-CR>",
	},
	{
		name = "Buffer Lines",
		action = ":lua Snacks.picker.lines()",
		keys = "",
	},
	{
		name = "Live Grep",
		action = ":lua Snacks.picker.grep()",
		keys = "<M-f>",
	},
	{
		name = "Grep Open Buffers",
		action = ":lua Snacks.picker.grep_buffers()",
		keys = "",
	},
	{
		name = "Visual Selection or Word",
		action = ":lua Snacks.picker.grep_word()",
		keys = "",
	},
	{
		name = "Man Pages",
		action = ":lua Snacks.picker.man()",
		keys = "",
	},
	{
		name = "Goto LSP Definition",
		action = ":lua Snacks.picker.lsp_definitions()",
		keys = "gtd",
	},
	{
		name = "Goto LSP Declaration",
		action = ":lua Snacks.picker.lsp_declarations()",
		keys = "ctD",
	},
	{
		name = "Goto LSP Type Definition",
		action = ":lua Snacks.picker.lsp_type_definitions()",
		keys = "gtt",
	},
	{
		name = "LSP Calls Incoming",
		action = ":lua Snacks.picker.lsp_incoming_calls()",
		keys = "",
	},
	{
		name = "LSP Calls Outgoing",
		action = ":lua Snacks.picker.lsp_outgoing_calls()",
		keys = "",
	},
	{
		name = "LSP Symbols",
		action = ":lua Snacks.picker.lsp_symbols()",
		keys = "",
	},
	{
		name = "LSP Workspace Symbols",
		action = ":lua Snacks.picker.lsp_workspace_symbols()",
		keys = "",
	},
	{
		name = "Goto References",
		action = ":lua Snacks.picker.lsp_references()",
		keys = "gtr",
	},
	{
		name = "Goto Implementations",
		action = ":lua Snacks.picker.lsp_implementations()",
		keys = "gti",
	},
	{
		name = "Diagnostics",
		action = ":lua Snacks.picker.diagnostics()",
		keys = "",
	},
	{
		name = "Buffer Diagnostics",
		action = ":lua Snacks.picker.diagnostics_buffer()",
		keys = "",
	},
	{
		name = "Git Status",
		action = ":lua Snacks.picker.git_status()",
		keys = "gst",
	},
	{
		name = "Git Branches",
		action = ":lua Snacks.picker.git_branches()",
		keys = "<space>bb",
	},
	{
		name = "Git Diff (Hunks)",
		action = ":lua Snacks.picker.git_diff()",
		keys = "<space>dd",
	},
	{
		name = "Git Stash",
		action = ":lua Snacks.picker.git_stash()",
		keys = "<space>ss",
	},
	{
		name = "Git Log",
		action = ":lua Snacks.picker.git_log()",
		keys = "",
	},
	{
		name = "Git Log Line",
		action = ":lua Snacks.picker.git_log_line()",
		keys = "",
	},
	{
		name = "Git Log File",
		action = ":lua Snacks.picker.git_log_file()",
		keys = "",
	},
	{
		name = "Keymaps",
		action = ":lua Snacks.picker.keymaps()",
		keys = "<space>KK",
	},
	{
		name = "Keymaps Telescope",
		action = ":Telescope keymaps ",
		keys = "<space>KK",
	},
	{
		name = "Inlay Hints",
		action = ":lua Snacks.toggle.inlay_hints()",
		keys = "",
	},
	{
		name = "Commands",
		action = ":lua Snacks.picker.commands()",
		keys = "",
	},
	{
		name = "Command History",
		action = ":lua Snacks.picker.command_history()",
		keys = "",
	},
	{
		name = "Notification History",
		action = ":lua Snacks.picker.notifications()",
		keys = "",
	},
	{
		name = "GitHub Issues (open)",
		action = ":lua Snacks.picker.gh_issue()",
		keys = "",
	},
	{
		name = "GitHub Issues (all)",
		action = ":lua Snacks.picker.gh_issue({state='all'})",
		keys = "",
	},
	{
		name = "GitHub Pull Requests (open)",
		action = ":lua Snacks.picker.gh_pr()",
		keys = "",
	},
	{
		name = "GitHub Pull Requests (all)",
		action = ":lua Snacks.picker.gh_pr({state='all'})",
		keys = "",
	},
	{
		name = "Search: Registers",
		action = ":lua Snacks.picker.registers()",
		keys = "",
	},
	{
		name = "Search: History",
		action = ":lua Snacks.picker.search_history()",
		keys = "",
	},
	{
		name = "Search: Autocmds",
		action = ":lua Snacks.picker.autocmds()",
		keys = "",
	},
	{
		name = "Help Pages",
		action = ":lua Snacks.picker.help()",
		keys = "",
	},
	{
		name = "Highlights",
		action = ":lua Snacks.picker.highlights()",
		keys = "",
	},
	{
		name = "Colorschemes",
		action = ":lua Snacks.picker.colorschemes()",
		keys = "",
	},
	{
		name = "Search for Plugin Spec",
		action = ":lua Snacks.picker.lazy()",
		keys = "",
	},
	{
		name = "Quickfix List",
		action = ":lua Snacks.picker.qflist()",
		keys = "",
	},
	{
		name = "Horizontal Terminal",
		action = ":split term://zsh",
		keys = "<space><space>t",
	},
	{
		name = "Vertical Terminal",
		action = ":vsplit term://zsh",
		keys = "<space><space>v",
	},

	{
		name = "Close current buffer",
		action = ":bd",
		keys = "<space><space>q",
	},
	{
		name = "Close all buffers but current",
		action = ":CurrBufOnly",
		keys = "<space><space>Q",
	},

	{
		name = "Copy Entire File",
		action = ":%y+",
		keys = "<C-c>",
	},

	-- Function keys
	{
		name = "Source Nvim",
		action = ":source ~/.config/nvim/init.lua",
		keys = "<F2>",
	},
	{
		name = "Wrap",
		action = ":set wrap!",
		keys = "<F4>",
	},
	{
		name = "Line Number",
		action = ":exec &nu==&rnu? 'se nu!' : 'se rnu!'",
		keys = "<F5>",
	},
	{
		name = "Cursorline",
		action = ":set cursorline!",
		keys = "<F6>",
	},
	{
		name = "Show Hidden Symbols [listchars]",
		action = ":set list!",
		keys = "<F7>",
	},
	{
		name = "Tagbar",
		action = ":TagbarToggle",
		keys = "<F8>",
	},
	{
		name = "Spell",
		action = ":set spell!",
		keys = "<F11>",
	},
	{
		name = "Colorcolumn",
		action = ":let &colorcolumn = &colorcolumn == '' ? '80,120' : ''",
		keys = "<F12>",
	},

	{
		name = "Nvim: Code Actions",
		action = ":lua vim.lsp.buf.code_action()",
		keys = "gra",
	},
	{
		name = "Nvim: Rename",
		action = ":lua vim.lsp.buf.rename()",
		keys = "grn",
	},

	{
		name = "Telescope Spell Suggest",
		action = ":Telescope spell_suggest",
		keys = "<leader>s",
	},
	{
		name = "Telescope Select Filetypes",
		action = ":Telescope filetypes",
		keys = "FF",
	},

	{
		name = "Gitsigns",
		action = ":Gitsigns",
		keys = "git",
	},
	{
		name = "Sensitivity: Cloak [toggle]",
		action = ":CloakToggle",
		keys = "",
	},
	{
		name = "UndoTree",
		action = ":lua require('undotree').open()",
		keys = "",
	},
	{
		name = "Trouble",
		action = ":Trouble",
		keys = "",
	},
	{
		name = "Update | Save",
		action = ":update",
		keys = "<leader>ww",
	},
	{
		name = "Update | Save in insert",
		action = "<C-o>:update",
		keys = "<leader>ww",
	},

	{
		name = "Namu: symbols",
		action = ":Namu symbols",
		keys = "<leader>ss",
	},
	{
		name = "Namu: workspace",
		action = ":Namu workspace",
		keys = "<leader>sw",
	},
	{
		name = "Namu: watchtower",
		action = ":Namu watchtower",
		keys = "",
	},

	{
		name = "Copy Entire File",
		action = ":%y",
		keys = "",
	},

	{
		name = "Hardtime toggle",
		action = ":Hardtime toggle",
		keys = "",
	},

	{
		name = "Todo Telescope",
		action = ":TodoTelescope",
		keys = "",
	},
}

-------------------------------------------------------------------------------
--- Logic

function M.show_commands()
	local items = {}

	local width = 0
	local width_keymap = 0
	local max_name_length = 0
	local max_keymap_length = 0

	for idx, command in ipairs(M.commands) do
		local item = {
            -- 'text' is required by Snacks for filtering/matching
			idx = idx,
			name = command.name,
			text = command.name,
			action = command.action,
		}

		if command["keys"] == "" then
			item.keys = "               "
		else
			item.keys = command.keys
		end

		max_name_length = math.max(max_name_length, #item.name)
		max_keymap_length = math.max(max_keymap_length, #item.keys)

		local total_length = #command.name + 10
		local total_length_keymaps = #command.keys + 10

		if total_length > width then
			width = total_length
		end

		if total_length_keymaps > width_keymap then
			width_keymap = total_length_keymaps
		end

		table.insert(items, item)
	end

	local padding = max_name_length + 10
	local padding_keymaps = max_keymap_length + 10

	Snacks.picker({
		title = "COMMAND PALETTE",
		sort_lastused = true,
		layout = { preset = "default", preview = false, },
		sort = { fields = { "name" }, },
		items = items,

		format = function(item, _)
			local ret = {}

			ret[#ret + 1] = { item.name, "SnacksPickerLabel" }
			ret[#ret + 1] = { string.rep(" ", padding - #item.name), virtual = true }
			ret[#ret + 1] = { item.keys, "SnacksPickerComment" }
			ret[#ret + 1] = { string.rep(" ", padding_keymaps - #item.keys), virtual = true }
			ret[#ret + 1] = { item.action, "SnacksPickerComment" }

			return ret
		end,

		confirm = function(picker, item)
			if type(item.action) == "string" then
				if item.action:find("^:") then
					picker:close()
					return picker:norm(function()
						picker:close()
						vim.cmd(item.action:sub(2))
					end)
				else
					return picker:norm(function()
						picker:close()
						local keys = vim.api.nvim_replace_termcodes(item.action, true, true, true)
						vim.api.nvim_input(keys)
					end)
				end
			end

			return picker:norm(function()
				picker:close()
				item.action()
			end)
		end,
	})
end

return M
