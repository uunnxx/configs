-- local luasnip = require("luasnip")
local snippy = require("snippy")
local cmp = require("cmp")
local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  window = {
    completion = {
      autocompletion = false,
      -- border = border 'CmpBorder',
      -- winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,SearchNone'
      winhighlight = "Normal:CmpPmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },

  -- formatting = {
  --   format = function(_, vim_item)
  --     -- vim_item.kind = lspkind.presets.default[vim_item.kind]
  --     vim_item.kind = string.format("%s ", vim_item.kind)
  --     return vim_item
  --   end
  -- },
  --

  --   formatting = {
  --     format = function(entry, vim_item)
  --       if vim.tbl_contains({ 'path' }, entry.source.name) then
  --         local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
  --         if icon then
  --           vim_item.kind = icon
  --           vim_item.kind_hl_group = hl_group
  --           return vim_item
  --         end
  --       end
  --       return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
  --     end
  -- },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },

  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },

  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      select = false,
    },

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

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
