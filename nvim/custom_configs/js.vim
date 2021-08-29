
autocmd FileType javascript call JSOption()

function JSOption()
  " hmm...
  inoremap ff function

  inoremap ttL console.log('')<left><left>
  nnoremap ttL ^Cconsole.log('')<left><left><Esc>p

  inoremap ttH console.log()<left>
  nnoremap ttH ^Cconsole.log()<left><Esc>p

  inoremap ttR require('')<left><left>
  nnoremap ttR ^Crequire('')<left><left><Esc>p

  inoremap ttC <Esc>^iconsole.log(<Esc>$a)
  nnoremap ttC ^iconsole.log(<Esc>$a)<Esc>

endfunction
