-- Treesitter
require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	ensure_installed = { "python" },
	highlight = {
		enable = true, -- Enable general highlighting,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		vim.treesitter.start()
	end,
})

-------------------------------------------------------------------------------
-- Highlight arguments' definitions and usages, asynchronously, using Treesitter
require("hlargs").setup()

-------------------------------------------------------------------------------
-- Performance related
-- require('impatient').enable_profile()

-------------------------------------------------------------------------------
-- Hop.nvim
local hop = require("hop")
local directions = require("hop.hint").HintDirection
local map = vim.keymap.set

map("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
map("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

-------------------------------------------------------------------------------
-- Trouble
require("trouble").setup({
	action_keys = { -- key mappings for actions in the trouble list
		-- map to {} to remove a mapping, for example:
		-- close = {},
		close = "q", -- close the list
		cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
		refresh = "r", -- manually refresh
		jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
		open_split = { "<c-x>" }, -- open buffer in new split
		open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
		open_tab = { "<c-t>" }, -- open buffer in new tab
		jump_close = { "o" }, -- jump to the diagnostic and close the list
		toggle_mode = "m", -- toggle between 'workspace' and 'document' diagnostics mode
		toggle_preview = "P", -- toggle auto_preview
		hover = "K", -- opens a small popup with the full multiline message
		preview = "p", -- preview the diagnostic location
		close_folds = { "zM", "zm" }, -- close all folds
		open_folds = { "zR", "zr" }, -- open all folds
		toggle_fold = { "zA", "za" }, -- toggle fold of current file
		previous = "k", -- previous item
		next = "j", -- next item
	},
	indent_lines = true, -- add an indent guide below the fold icons
	auto_open = false, -- automatically open the list when you have diagnostics
	auto_close = true, -- automatically close the list when you have no diagnostics
	auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
	auto_fold = false, -- automatically fold a file trouble list at creation
	auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
	signs = {
		-- icons / text used for a diagnostic
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "﫠",
	},
	use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
})

-------------------------------------------------------------------------------
-- Surround
-- Sv or S{ for a variable
-- Sb       for a block
-- Si       for an if statement
-- Sw       for a with statement
-- Sc       for a comment
-- Sf       for a for statement
-- S%       for other template tags

vim.cmd([[
    let b:surround_{char2nr('v')} = '{{ \r }}'
    let b:surround_{char2nr('{')} = '{{ \r }}'
    let b:surround_{char2nr('%')} = '{% \r %}'
    let b:surround_{char2nr('b')} = '{% block \1block name: \1 %}\r{% endblock \1\1 %}'
    let b:surround_{char2nr('i')} = '{% if \1condition: \1 %}\r{% endif %}'
    let b:surround_{char2nr('w')} = '{% with \1with: \1 %}\r{% endwith %}'
    let b:surround_{char2nr('f')} = '{% for \1for loop: \1 %}\r{% endfor %}'
    let b:surround_{char2nr('c')} = '{% comment %}\r{% endcomment %}'
]])

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "black", "isort", "autopep8", "ruff" },
		htmldjango = { "djlint" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})
