local snippy = require("snippy")
local cmp = require("cmp")
local lspkind = require("lspkind")

local has_words_before = function()
	table.unpack = table.unpack or unpack

	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	window = {
		completion = {
            border = "single", -- single / rounded / none
			autocompletion = false,
			winhighlight = "Normal:CmpPmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
        documentation = {
            border = 'single', -- single / rounded / none
			winhighlight = "Normal:CmpPmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
        }
	},
	formatting = {
		-- fields = { "kind", "abbr", "menu" },
		fields = { "icon", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = {
					menu = 25, -- leading text (labelDetails)
					abbr = 25, -- actual suggestion item
				},
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				show_labelDetails = true, -- show labelDetails in menu. Disabled by default
				menu = {
					async_path = "[PATH] ",
					buffer = "[BUF] ",
					nvim_lsp = "[LSP] ",
					nvim_lua = "[LUA] ",
					sql = "[SQL] ",
					snippy = "[SNIP] ",
					dotenv = "[ENV] ",
					pypi = "[VER] ",
					calc = "[CALC] ",
				},
			})(entry, vim_item)
			kind.icon = " " .. (kind.icon or "") .. "  "
			-- kind.kind = "   [" .. (kind.kind or "") .. "]"

			return kind
		end,
		-- format = lspkind.cmp_format({
		-- 	mode = "symbol_text",
		-- 	menu = {
		-- 		async_path = "[PATH] ",
		-- 		buffer = "[BUF] ",
		-- 		nvim_lsp = "[LSP] ",
		-- 		nvim_lua = "[LUA] ",
		-- 		sql = "[SQL] ",
		-- 		snippy = "[SNIP] ",
		-- 		dotenv = "[ENV] ",
		-- 		pypi = "[VER] ",
		-- 		calc = "[CALC] ",
		-- 	},
		-- 	maxwidth = {
		-- 		-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		-- 		-- can also be a function to dynamically calculate max width such as
		-- 		-- menu = function() return math.floor(0.45 * vim.o.columns) end,
		-- 		menu = 25, -- leading text (labelDetails)
		-- 		abbr = 25, -- actual suggestion item
		-- 	},
		-- 	ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		-- 	show_labelDetails = true, -- show labelDetails in menu. Disabled by default
		--
		-- 	-- The function below will be called before any actual modifications from lspkind
		-- 	-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		-- 	before = function(entry, vim_item)
		-- 		-- ...
		-- 		return vim_item
		-- 	end,
		-- }),
	},

	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},

	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-Space>"] = cmp.mapping.scroll_docs(4),
		-- ['<C-Space>'] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			select = false,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif snippy.can_expand_or_advance() then
				snippy.expand_or_advance()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif snippy.can_jump(-1) then
				snippy.previous()
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "snippy" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "async_path" },
		{ name = "nvim_lua" },
		{ name = "dotenv" },
		{ name = "sql" },
		{ name = "pypi", keyword_length = 4 },
		{ name = "calc" },
	},
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	-- view = {
	--     entries = { name = 'wildmenu', separator = ' | ' }
	-- },
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
