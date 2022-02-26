local cmd  = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec   -- execute Vimscript
local g    = vim.g               -- global variables
local opt  = vim.opt             -- global/buffer/windows-scoped options

-- Tagbar
g.tagbar_compact = 1
g.tagbar_sort = 0

-- ALE
g.ale_fixers = { javascript= { 'eslint', 'prettier' } }
-- g.ale_linters.ruby = {'solargraph', 'rubocop', 'ruby'}

g.ale_sign_error = '❌'
g.ale_sign_warning = '⚠️'

g.ale_fix_on_save = 0
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0





-----------------------------------------------------------
-- User Interface
-----------------------------------------------------------

g.gruvbox_contrast_dark = 'hard'
g.gruvbox_invert_selection = 0
g.gruvbox_italic = 1
g.gruvbox_inverse = 1
g.gruvbox_underline = 1
g.gruvbox_undercurl = 1
-- g.gruvbox_transparent_bg = 1
cmd'colorscheme gruvbox'


-- Transparency background
-- cmd [[
--   highlight! Normal ctermbg=none guibg=none
--   highlight! QuickFixLine ctermbg=none guibg=none
--   highlight! CursorLineSign ctermbg=none guibg=none
--   highlight! CursorLineNr ctermbg=none guibg=none
--   highlight! SignColumn ctermbg=none guibg=none
-- ]]






-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

-- Jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]


-- Remember last edit position
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]


-- highlight Yanks
exec(
  [[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
    augroup end
  ]],
  false
)
