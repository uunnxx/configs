" Quickly jump to header or source file
" This technique can probably be applied to many filetypes.
" It sets file marks (see :h marks) when leaving a source or header file,
" so you can quickly jump back to the last accessed one
" by using 'C or 'H (see :h 'A).


" NOTE: The info is saved in the viminfo file, so make sure that
" :set viminfo? includes :h viminfo-'.

autocmd FileType *.{cpp,c} mark C
autocmd FileType *.h mark H
autocmd FileType cpp,c call CppCOptions()

function CppCOptions()

  inoremap <buffer> iinc #include <><left>
  inoremap <buffer> innc #include ""<left>
  inoremap TTT # => 

  " inoremap ttP print('')<left><left>
  " inoremap ttL print()<left>

  " nnoremap tH 0f#f{a
  " nnoremap tL 0f#f}i


endfunction
