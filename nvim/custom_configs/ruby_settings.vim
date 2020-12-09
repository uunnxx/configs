" Settings for Ruby:
"
" Run ruby code <leader>rr
autocmd FileType ruby nmap <buffer> <leader>rr :w\|:!ruby ./%<cr>

autocmd FileType ruby setlocal tags+=./tags;
autocmd FileType ruby set tags+=/home/unx/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/tags;

" Ruby_run.vim plugin's section:
"
autocmd FileType ruby noremap <buffer> <silent> <space>rr :call RubyRun()<cr>
autocmd FileType ruby vnoremap <buffer> <silent> <space>rr :call RubyRangeRun()<cr>

" Ruby autocomplete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1


" inoremap \|<tab> \|\|<left>
autocmd FileType ruby let g:AutoPairs = AutoPairsDefine({ '|' : '|', '<%=' : '%>' })
autocmd FileType eruby let g:AutoPairs = AutoPairsDefine({ '|' : '|', '<%=' : '%>' })
" au FileType ruby let b:AutoPairs = AutoPairsDefine({'\v(^|\W)\zsbegin': 'end//n'})
" au FileType ruby let b:AutoPairs = AutoPairsDefine({'begin': 'end//n]'})

autocmd FileType ruby inoremap ttH "#{}"<left><left>
autocmd FileType ruby inoremap ttL #{}<left>
autocmd FileType ruby inoremap ttP puts "#{}"<left><left>
autocmd FileType ruby nnoremap tH f#f{a
autocmd FileType ruby nnoremap tL f#f}i
autocmd FileType ruby nnoremap ttL F}i
autocmd FileType ruby nnoremap ttH F{a

" Evaluate and print out: _erbout << something.to_s
autocmd FileType eruby inoremap tH <%=  %><left><left><left>
" Evaluate without printing out: something_else
autocmd FileType eruby inoremap tL <%  %><left><left><left>
" Comment
autocmd FileType eruby inoremap tC <%#  %><left><left><left>

" autocmd BufWrite *.rb :!ruby ./%
