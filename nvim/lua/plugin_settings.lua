require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}


-- require('emmet-vim').setup()
    -- setup = function () -- load stuff before the plugin is loaded
    --   vim.g.user_emmet_leader_key = '<c-m>'
    --   vim.g.user_emmet_settings = {
    --   indent_blockelement = 1,
    -- }
    -- end,


-- Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
      enable = true
  }
}

-- Highlight arguments' definitions and usages, asynchronously, using Treesitter
require('hlargs').setup()


-- Shade
-- require'shade'.setup({
--   overlay_opacity = 50,
--   opacity_step = 1,
--   keys = {
--     brightness_up    = '<C-Up>',
--     brightness_down  = '<C-Down>',
--     toggle           = '<Leader>s',
--   }
-- })

-- Performance related
require('impatient').enable_profile()


-- Hop.nvim
-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})
vim.keymap.set('', 'nn', function()
  hop.hint_words({})
end, {remap=true})



vim.keymap.set('', 'N', function()
  hop.hint_lines({ current_line_only = false})
end, {remap=true})
