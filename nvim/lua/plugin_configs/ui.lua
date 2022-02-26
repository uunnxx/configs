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






