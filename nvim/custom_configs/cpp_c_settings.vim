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
