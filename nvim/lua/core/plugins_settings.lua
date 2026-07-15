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

-- Flash HopWord
vim.keymap.set({ "n", "x", "o" }, ",m", function()
	local Flash = require("flash")

	---@param opts Flash.Format
	local function format_first_match(opts)
		-- always show first and second label
		return {
			{ opts.match.label1, opts.hl_group },
			{ opts.match.label2, opts.hl_group },
		}
	end

	local function format_second_match(opts)
		return {
			{ opts.match.label2, opts.hl_group },
		}
	end

	Flash.jump({
		search = { mode = "search" },
		label = { after = false, before = { 0, 0 }, uppercase = false, format = format_first_match },
		pattern = [[\<]],
		action = function(match, state)
			state:hide()
			Flash.jump({
				search = { max_length = 0 },
				highlight = { matches = false },
				label = { after = { 0, 2 }, format = format_second_match },
				matcher = function(win)
					-- limit matches to the current label
					return vim.tbl_filter(function(m)
						return m.label == match.label and m.win == win
					end, state.results)
				end,
				labeler = function(matches)
					for _, m in ipairs(matches) do
						m.label = m.label2 -- use the second label
					end
				end,
			})
		end,
		labeler = function(matches, state)
			local labels = state:labels()
			for m, match in ipairs(matches) do
				match.label1 = labels[math.floor((m - 1) / #labels) + 1]
				match.label2 = labels[(m - 1) % #labels + 1]
				match.label = match.label1
			end
		end,
	})
end)

-- vim.keymap.set({ "n", "x", "o" }, "lf", function()
-- 	require("flash").jump({
-- 		search = { mode = "search", max_length = 0 },
-- 		label = { after = { 0, 0 } },
-- 		pattern = "^",
-- 	})
-- end)

local navic = require("nvim-navic")
navic.setup({
	icons = {
		File = "󰈙 ",
		Module = " ",
		Namespace = "󰌗 ",
		Package = " ",
		Class = "󰌗 ",
		Method = "󰆧 ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = "󰕘",
		Interface = "󰕘",
		Function = "󰊕 ",
		Variable = "󰆧 ",
		Constant = "󰏿 ",
		String = "󰀬 ",
		Number = "󰎠 ",
		Boolean = "◩ ",
		Array = "󰅪 ",
		Object = "󰅩 ",
		Key = "󰌋 ",
		Null = "󰟢 ",
		EnumMember = " ",
		Struct = "󰌗 ",
		Event = " ",
		Operator = "󰆕 ",
		TypeParameter = "󰊄 ",
		enabled = true,
	},

	separator = "%#NavicSeparator#  %*",
	highlight = true,
})
