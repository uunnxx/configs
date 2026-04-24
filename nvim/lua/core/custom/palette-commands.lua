local palette = require("core.custom.command-palette")

-- Explorer
palette.add_command({
	name = "Recent",
	action = ":lua Snacks.picker.recent()",
	keys = "",
})
palette.add_command({
	name = "Explorer",
	action = ":lua Snacks.explorer()",
	keys = "<C-n>",
})
palette.add_command({
	name = "Find Files [smart]",
	action = ":lua Snacks.picker.smart()",
	keys = "tt",
})
palette.add_command({
	name = "Find Files",
	action = ":lua Snacks.picker.files()",
	keys = "<S-CR>",
})
palette.add_command({
	name = "Find Config Files",
	action = ":lua Snacks.picker.files({cwd=vim.fn.stdpath('config')})",
	keys = "",
})
palette.add_command({
	name = "Find Git Files",
	action = ":lua Snacks.picker.git_files()",
	keys = "",
})
palette.add_command({
	name = "Projects",
	action = ":lua Snacks.picker.projects()",
	keys = "",
})
palette.add_command({
	name = "Buffers",
	action = ":lua Snacks.picker.buffers()",
	keys = "<C-CR>",
})
palette.add_command({
	name = "Buffer Lines",
	action = ":lua Snacks.picker.lines()",
	keys = "",
})
palette.add_command({
	name = "Close current buffer",
	action = ":bd",
	keys = "<space><space>q",
})
palette.add_command({
	name = "Close all buffers but current",
	action = ":CurrBufOnly",
	keys = "<space><space>Q",
})

-- Grep
palette.add_command({
	name = "Live Grep",
	action = ":lua Snacks.picker.grep()",
	keys = "<M-f>",
})
palette.add_command({
	name = "Grep Open Buffers",
	action = ":lua Snacks.picker.grep_buffers()",
	keys = "",
})

-- Todo
palette.add_command({
	name = "Todo Telescope",
	action = ":TodoTelescope",
	keys = "",
})

-- Namu
palette.add_command({
	name = "Namu: symbols",
	action = ":Namu symbols",
	keys = "<leader>ss",
})
palette.add_command({
	name = "Namu: workspace",
	action = ":Namu workspace",
	keys = "<leader>sw",
})
palette.add_command({
	name = "Namu: watchtower",
	action = ":Namu watchtower",
	keys = "",
})

-- Git related
palette.add_command({
	name = "Gitsigns",
	action = ":Gitsigns",
	keys = "git",
})
palette.add_command({
	name = "Git Status",
	action = ":lua Snacks.picker.git_status()",
	keys = "gst",
})
palette.add_command({
	name = "Git Branches",
	action = ":lua Snacks.picker.git_branches()",
	keys = "<space>bb",
})
palette.add_command({
	name = "Git Diff (Hunks)",
	action = ":lua Snacks.picker.git_diff()",
	keys = "<space>dd",
})
palette.add_command({
	name = "Git Stash",
	action = ":lua Snacks.picker.git_stash()",
	keys = "<space>ss",
})
palette.add_command({
	name = "Git Log",
	action = ":lua Snacks.picker.git_log()",
	keys = "",
})
palette.add_command({
	name = "Git Log Line",
	action = ":lua Snacks.picker.git_log_line()",
	keys = "",
})
palette.add_command({
	name = "Git Log File",
	action = ":lua Snacks.picker.git_log_file()",
	keys = "",
})

-- Github related
palette.add_command({
	name = "GitHub Issues (open)",
	action = ":lua Snacks.picker.gh_issue()",
	keys = "",
})
palette.add_command({
	name = "GitHub Issues (all)",
	action = ":lua Snacks.picker.gh_issue({state='all'})",
	keys = "",
})
palette.add_command({
	name = "GitHub Pull Requests (open)",
	action = ":lua Snacks.picker.gh_pr()",
	keys = "",
})
palette.add_command({
	name = "GitHub Pull Requests (all)",
	action = ":lua Snacks.picker.gh_pr({state='all'})",
	keys = "",
})

-- Gotos
palette.add_command({
	name = "Goto LSP Definition",
	action = ":lua Snacks.picker.lsp_definitions()",
	keys = "gtd",
})
palette.add_command({
	name = "Goto LSP Declaration",
	action = ":lua Snacks.picker.lsp_declarations()",
	keys = "ctD",
})
palette.add_command({
	name = "Goto LSP Type Definition",
	action = ":lua Snacks.picker.lsp_type_definitions()",
	keys = "gtt",
})
palette.add_command({
	name = "Goto References",
	action = ":lua Snacks.picker.lsp_references()",
	keys = "gtr",
})
palette.add_command({
	name = "Goto Implementations",
	action = ":lua Snacks.picker.lsp_implementations()",
	keys = "gti",
})

-- LSP
palette.add_command({
	name = "LSP Calls Incoming",
	action = ":lua Snacks.picker.lsp_incoming_calls()",
	keys = "",
})
palette.add_command({
	name = "LSP Calls Outgoing",
	action = ":lua Snacks.picker.lsp_outgoing_calls()",
	keys = "",
})
palette.add_command({
	name = "LSP Symbols",
	action = ":lua Snacks.picker.lsp_symbols()",
	keys = "",
})
palette.add_command({
	name = "LSP Workspace Symbols",
	action = ":lua Snacks.picker.lsp_workspace_symbols()",
	keys = "",
})
palette.add_command({
	name = "Diagnostics",
	action = ":lua Snacks.picker.diagnostics()",
	keys = "",
})
palette.add_command({
	name = "Buffer Diagnostics",
	action = ":lua Snacks.picker.diagnostics_buffer()",
	keys = "",
})

-- Neovim
palette.add_command({
	name = "Nvim: Code Actions",
	action = ":lua vim.lsp.buf.code_action()",
	keys = "gra",
})
palette.add_command({
	name = "Nvim: Rename",
	action = ":lua vim.lsp.buf.rename()",
	keys = "grn",
})

-- Etc
palette.add_command({
	name = "Sensitivity: Cloak [toggle]",
	action = ":CloakToggle",
	keys = "",
})
palette.add_command({
	name = "UndoTree",
	action = ":lua require('undotree').open()",
	keys = "",
})
palette.add_command({
	name = "Trouble",
	action = ":Trouble",
	keys = "",
})
palette.add_command({
	name = "Tagbar",
	action = ":TagbarToggle",
	keys = "<F8>",
})
palette.add_command({
	name = "Telescope Spell Suggest",
	action = ":Telescope spell_suggest",
	keys = "<leader>s",
})
palette.add_command({
	name = "Telescope Select Filetypes",
	action = ":Telescope filetypes",
	keys = "FF",
})
palette.add_command({
	name = "Copy Entire File",
	action = ":%y",
	keys = "",
})

-- Default
palette.add_command({
	name = "Source Nvim",
	action = ":source ~/.config/nvim/init.lua",
	keys = "",
})
palette.add_command({
	name = "Wrap",
	action = ":set wrap!",
	keys = "",
})
palette.add_command({
	name = "Line Number",
	action = ":exec &nu==&rnu? 'se nu!' : 'se rnu!'",
	keys = "",
})
palette.add_command({
	name = "Cursorline",
	action = ":set cursorline!",
	keys = "",
})
palette.add_command({
	name = "Show Hidden Symbols [listchars]",
	action = ":set list!",
	keys = "",
})
palette.add_command({
	name = "Spell",
	action = ":set spell!",
	keys = "",
})
palette.add_command({
	name = "Colorcolumn",
	action = ":let &colorcolumn = &colorcolumn == '' ? '80,120' : ''",
	keys = "",
})
palette.add_command({
	name = "Horizontal Terminal",
	action = ":split term://zsh",
	keys = "<space><space>t",
})
palette.add_command({
	name = "Vertical Terminal",
	action = ":vsplit term://zsh",
	keys = "<space><space>v",
})

-- Snacks
palette.add_command({
	name = "Visual Selection or Word",
	action = ":lua Snacks.picker.grep_word()",
	keys = "",
})
palette.add_command({
	name = "Man Pages",
	action = ":lua Snacks.picker.man()",
	keys = "",
})
palette.add_command({
	name = "Keymaps",
	action = ":lua Snacks.picker.keymaps()",
	keys = "",
})
palette.add_command({
	name = "Keymaps Telescope",
	action = ":Telescope keymaps ",
	keys = "",
})
palette.add_command({
	name = "Inlay Hints",
	action = ":lua Snacks.toggle.inlay_hints()",
	keys = "",
})
palette.add_command({
	name = "Commands",
	action = ":lua Snacks.picker.commands()",
	keys = "",
})
palette.add_command({
	name = "Command History",
	action = ":lua Snacks.picker.command_history()",
	keys = "",
})
palette.add_command({
	name = "Notification History",
	action = ":lua Snacks.picker.notifications()",
	keys = "",
})
palette.add_command({
	name = "Search: Registers",
	action = ":lua Snacks.picker.registers()",
	keys = "",
})
palette.add_command({
	name = "Search: History",
	action = ":lua Snacks.picker.search_history()",
	keys = "",
})
palette.add_command({
	name = "Search: Autocmds",
	action = ":lua Snacks.picker.autocmds()",
	keys = "",
})
palette.add_command({
	name = "Help Pages",
	action = ":lua Snacks.picker.help()",
	keys = "",
})
palette.add_command({
	name = "Highlights",
	action = ":lua Snacks.picker.highlights()",
	keys = "",
})
palette.add_command({
	name = "Colorschemes",
	action = ":lua Snacks.picker.colorschemes()",
	keys = "",
})
palette.add_command({
	name = "Search for Plugin Spec",
	action = ":lua Snacks.picker.lazy()",
	keys = "",
})
palette.add_command({
	name = "Quickfix List",
	action = ":lua Snacks.picker.qflist()",
	keys = "",
})

-- Llama
palette.add_command({
	name = "llama toggle",
	action = ":LlamaToggle",
	keys = "",
})
palette.add_command({
	name = "llama toggle autofim",
	action = ":LlamaToggleAutoFim",
	keys = "",
})

-- apidocs.nvim
palette.add_command({
	name = "Search API Docs",
	action = ":ApidocsOpen",
	keys = "",
})

palette.add_command({
	name = "Restart",
	action = ":restart",
	keys = "",
})

-- vim.api.nvim_create_user_command('CMD', function()
-- 	require("core.custom.command-palette").show_commands()
-- end, {})

vim.keymap.set({"n", "i"}, "<C-c>", function()
	palette.show_commands()
end, { desc = "Open Command Palette" })

vim.keymap.set("n", "TT", function()
	palette.show_commands()
end, { desc = "Open Command Palette" })
