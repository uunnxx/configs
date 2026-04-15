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
			border = "single", -- single / rounded / none
			winhighlight = "Normal:CmpPmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
		},
	},
	formatting = {
		-- fields = { "kind", "abbr", "menu" },
		fields = { "icon", "abbr", "menu" },
		format = function(entry, vim_item)
			local highlight_info = require("colorful-menu").cmp_highlights(entry)

			if highlight_info ~= nil then
				vim_item.abbr_hl_group = highlight_info.highlights
				vim_item.abbr = highlight_info.text
			end

			local kind = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = {
					menu = 10, -- leading text (labelDetails)
					abbr = 100, -- actual suggestion item
				},
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				show_labelDetails = false, -- show labelDetails in menu. Disabled by default
				menu = {
					async_path = "[PATH] ",
					buffer = "[BUF] ",
					nvim_lsp = "[LSP] ",
					nvim_lua = "[LUA] ",
					sql = "[SQL] ",
					snippy = "[SNIP] ",
					dotenv = "[ENV] ",
					pypi = "[VERS] ",
					calc = "[CALC] ",
				},
			})(entry, vim.deepcopy(vim_item))
			kind.icon = " " .. (kind.icon or "") .. "  "
			return kind
		end,
	},

	snippet = {
		expand = function(args)
			snippy.expand_snippet(args.body)
		end,
	},

	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-Space>"] = cmp.mapping.scroll_docs(4),
		-- ['<C-Space>'] = cmp.mapping.complete(),
		-- ['<C-e>'] = cmp.mapping.abort(),
		['<C-c>'] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			select = false,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif snippy.can_jump(1) then
				snippy.next()
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

		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if snippy.can_expand_or_advance() then
		-- 		snippy.expand_or_advance()
		-- 	elseif cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif has_words_before() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if snippy.can_jump(-1) then
		-- 		snippy.previous()
		-- 	elseif cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "snippy" },
		{ name = "buffer", keyword_length = 2 },
		{ name = "async_path" },
		{ name = "nvim_lua" },
		{ name = "dotenv" },
		-- { name = "sql" },
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

cmp.setup.filetype({ "namu_prompt", "namu_sidebar" }, {
	enabled = false,
})

-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function()
		require("cmp").setup.buffer({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "snippy" },
				{ name = "buffer", keyword_length = 2 },
				{ name = "async_path" },
				{ name = "nvim_lua" },
				{ name = "dotenv" },
				{ name = "sql" },
				{ name = "calc" },
			},
		})
	end,
})

