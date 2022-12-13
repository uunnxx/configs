-----------------------------------------------------------
-- User Interface
-----------------------------------------------------------

local g    = vim.g               -- global variables
local cmd  = vim.cmd             -- execute Vim commands

local colors = require('gruvbox.palette')
local config = require('gruvbox').config

require("gruvbox").setup({
  overrides = {
    GruvboxRedSign = { bg = "NONE" },
    GruvboxYellowSign = { bg = "NONE" },
    GruvboxGreenSign = { bg = "NONE" },
    GruvboxAquaSign = { bg = "NONE" },
    Normal = { bg = "NONE" },
    QuickFixLine = { bg = "NONE" },
    CursorLineSign = { bg = "NONE" },
    CursorLineNr = { bg = "NONE" },
    SignColumn = { bg = "NONE" },

    -- LspReferenceRead = { bg = "NONE" },
    -- LspReferenceText = { bg = "NONE" },
    -- LspReferenceWrite = { bg = "NONE" },
    -- LspCodeLens = { bg = "NONE" },

    DiagnosticSignError = {
      bg = "NONE",
      fg = colors.bright_red,
      bold = config.bold,
      reverse = config.invert_signs
    },
    DiagnosticSignWarn = {
      bg = "NONE",
      fg = colors.bright_yellow,
      bold = config.bold,
      reverse = config.invert_signs
    },
    DiagnosticSignInfo = {
      bg = "NONE",
      fg = colors.bright_blue,
      bold = config.bold,
      reverse = config.invert_signs
    },
  },
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})


vim.o.background = "dark"
cmd'colorscheme gruvbox'


-- Transparency background
cmd [[
  highlight! Normal ctermbg=none guibg=none
  highlight! QuickFixLine ctermbg=none guibg=none
  highlight! CursorLineSign ctermbg=none guibg=none
  highlight! CursorLineNr ctermbg=none guibg=none
  highlight! SignColumn ctermbg=none guibg=none
]]


-- Colorizer
-- Tabs
require'colorizer'.setup()

-- Indent blankline
vim.opt.termguicolors = true

cmd [[
  highlight IndentBlanklineIndent1 guifg=#282828 gui=nocombine
  highlight IndentBlanklineIndent2 guifg=#FB4934 gui=nocombine
  highlight IndentBlanklineIndent3 guifg=#B8BB26 gui=nocombine
  highlight IndentBlanklineIndent4 guifg=#FABD2F gui=nocombine
  highlight IndentBlanklineIndent5 guifg=#83A598 gui=nocombine
  highlight IndentBlanklineIndent6 guifg=#D3869B gui=nocombine
]]


-- Highlight ERROR NOTE BUG INFO HACK CHANGED CHANGES WARNING FIXME README TODO IDEA CONCEPT
-- Colors located in ~/.nvim/plugged/gruvbox/colors/gruvbox.vim
-- Line 576 to Line 579

cmd[[

autocmd Syntax * call matchadd('Todo', '\W\zs\(CONCEPT\|TODO\|FIXME\|CHANGED\|CHANGES\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|README\|unx\|SYNTAX\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|WARNING\|BUG\)')

autocmd Filetype python,ruby,c,cpp,elixir,rust match Error /\s\+$/
" match Error /\s\+$/
]]





-- Disable number in terminal
cmd[[autocmd TermOpen * setlocal nonumber norelativenumber]]

