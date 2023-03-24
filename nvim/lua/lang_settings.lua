local cmd  = vim.cmd             -- execute Vim commands

-- noexpandtab
-- copyindent
-- preserveindent
-- softtabstop=0
-- shiftwidth=4
-- tabstop=4
cmd[[ autocmd FileType c,cpp,java setlocal noet ci pi sts=0 sw=4 ts=4 ]]

-- set lsp_markdown filetype for '*.md' files
-- cmd[[ autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown setlocal ft=lsp_markdown ]]

-- don't auto comment new lines
-- cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,css setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[ autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2 ]]

-- Jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]

-- Call `Autoformat` python files on save
cmd[[autocmd BufWritePost,FileWritePost *.py Autoformat]]
