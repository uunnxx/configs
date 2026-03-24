-- Treesitter
require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	ensure_installed = { "python", "html", "htmldjango", "ruby", "javascript" },
	highlight = {
		enable = true, -- Enable general highlighting,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "htmldjango", "ruby", "javascript" },
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


-------------------------------------------------------------------------------
-- tpope's surround plugin
-- Sv or S{ for a variable
-- Sb       for a block
-- Si       for an if statement
-- Sw       for a with statement
-- Sc       for a comment
-- Sf       for a for statement
-- S%       for other template tags

-- vim.cmd([[
--     let b:surround_{char2nr('v')} = '{{ \r }}'
--     let b:surround_{char2nr('{')} = '{{ \r }}'
--     let b:surround_{char2nr('%')} = '{% \r %}'
--     let b:surround_{char2nr('b')} = '{% block \1block name: \1 %}\r{% endblock \1\1 %}'
--     let b:surround_{char2nr('i')} = '{% if \1condition: \1 %}\r{% endif %}'
--     let b:surround_{char2nr('w')} = '{% with \1with: \1 %}\r{% endwith %}'
--     let b:surround_{char2nr('f')} = '{% for \1for loop: \1 %}\r{% endfor %}'
--     let b:surround_{char2nr('c')} = '{% comment %}\r{% endcomment %}'
-- ]])