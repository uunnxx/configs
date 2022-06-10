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

-- Run-code
require('run-code').setup {
  output = {
    buffer = true,
    split_cmd = '20split',
  }
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
