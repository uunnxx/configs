" Leader shortcuts for Rails.vim commands
map <leader>m :Rmodel
map <leader>c :Rcontroller
map <leader>v :Rview
map <leader>u :Runittest
map <leader>f :Rfunctionaltest
map <leader>tm :RTmodel
map <leader>tc :RTcontroller
map <leader>tv :RTview
map <leader>tu :RTunittest
map <leader>tf :RTfunctionaltest
map <leader>sm :RSmodel
map <leader>sc :RScontroller
map <leader>sv :RSview
map <leader>su :RSunittest
map <leader>sf :RSfunctionaltest

" Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

" For Haml
" au! BufRead,BufNewFile *.haml         set filetype=haml

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <leader>e
nmap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <leader>t
nmap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Edit the README_FOR_APP (makes :R commands work)
nmap <leader>R :e doc/README_FOR_APP<CR>
