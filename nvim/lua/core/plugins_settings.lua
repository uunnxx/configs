-------------------------------------------------------------------------------
-- Highlight arguments' definitions and usages, asynchronously, using Treesitter

require("hlargs").setup()

require("vim._core.ui2").enable({
	enable = true, -- Whether to enable or disable the UI.

	msg = { -- Options related to the message module.
		---@type 'cmd'|'msg' Default message target, either in the
		---cmdline or in a separate ephemeral message window.
		---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
		---or table mapping |ui-messages| kinds and triggers to a target.
		targets = "cmd",
		cmd = { -- Options related to messages in the cmdline window.
			height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
		},
		dialog = { -- Options related to dialog window.
			height = 0.5, -- Maximum height.
		},
		msg = { -- Options related to msg window.
			height = 0.5, -- Maximum height.
			timeout = 4000, -- Time a message is visible in the message window.
		},
		pager = { -- Options related to message window.
			height = 1, -- Maximum height.
		},
	},
})


-- Hop.nvim
local hop = require("hop")
local directions = require("hop.hint").HintDirection

vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })


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
