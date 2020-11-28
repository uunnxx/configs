" hmm...
au FileType javascript inoremap fF function

" console.log
au FileType javascript inoremap ttL console.log('')<left><left>
au FileType javascript nnoremap ttL ^Cconsole.log('')<left><left><Esc>p

au FileType javascript inoremap ttH console.log()<left>
au FileType javascript nnoremap ttH ^Cconsole.log()<left><Esc>p

au FileType javascript inoremap ttR require('')<left><left>
au FileType javascript nnoremap ttR ^Crequire('')<left><left><Esc>p
" au FileType javascript vnoremap ttR Irequire('')<left><left><Esc>p
