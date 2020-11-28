" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd BufRead '$HOME/go/src/*.go'
      \  let s:tmp = matchlist(expand('%:p'),
      \ $HOME/go/src/\(github.com/Massad/[^/]\+\)')
      \| if len(s:tmp) > 1 |  exe 'silent :GoGuruScope ' . s:tmp[1] | endif
      \| unlet s:tmp


" :GoAlternate  commands :A, :AV, :AS and :AT
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nnoremap <leader>d :GoDecls<CR>
autocmd FileType go nnoremap <leader>D :GoDeclsDir<CR>
" :GoDef but opens in a vertical split
autocmd FileType go nmap <leader>v <Plug>(go-def-vertical)
" :GoDef but opens in a horizontal split
autocmd FileType go nmap <leader>s <Plug>(go-def-split)
autocmd FileType go nmap gd <Plug>(go-def)
autocmd FileType go nmap <leader>i <Plug>(go-info)

" Sets
autocmd FileType go set updatetime=800
autocmd FileType go set noexpandtab
autocmd FileType go set shiftwidth=4
autocmd FileType go set softtabstop=4
autocmd FileType go set tabstop=4

" Highlights
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" Highlight same variable when cursor under some of them
let g:go_auto_sameids = 0
" Auto import dependencies
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"
let g:go_list_type = "quickfix"
