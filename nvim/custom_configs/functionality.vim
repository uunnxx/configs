autocmd FileType c,cpp           setlocal path+=/usr/include include&
autocmd FileType sh,zsh,csh,tcsh setlocal include=^\\s*\\%(\\.\\\|source\\)\\s

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
