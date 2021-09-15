autocmd FileType python,py call PythonOptions()

function PythonOptions()

  inoremap ttP print('')<left><left>
  inoremap ttL print()<left>

  " nnoremap tH 0f#f{a
  " nnoremap tL 0f#f}i

  inoremap TTT # => 

endfunction
