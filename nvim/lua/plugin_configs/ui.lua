-----------------------------------------------------------
-- User Interface
-----------------------------------------------------------

local g    = vim.g               -- global variables
local cmd  = vim.cmd             -- execute Vim commands

g.gruvbox_contrast_dark = 'hard'
g.gruvbox_invert_selection = 0
g.gruvbox_italic = 1
g.gruvbox_inverse = 1
g.gruvbox_underline = 1
g.gruvbox_undercurl = 1
-- g.gruvbox_transparent_bg = 1
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
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#8EC07C gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#FB4934 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#B8BB26 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#FABD2F gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#83A598 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#D3869B gui=nocombine]]



-- Highlight ERROR NOTE BUG INFO HACK CHANGED CHANGES WARNING FIXME README TODO IDEA CONCEPT
-- Colors located in ~/.nvim/plugged/gruvbox/colors/gruvbox.vim
-- Line 576 to Line 579

vim.cmd[[

autocmd Syntax * call matchadd('Todo', '\W\zs\(CONCEPT\|TODO\|FIXME\|CHANGED\|CHANGES\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|README\|unx\|SYNTAX\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|WARNING\|BUG\)')

" autocmd Filetype python,ruby,c,cpp match Error /\s\+$/
match Error /\s\+$/
]]






