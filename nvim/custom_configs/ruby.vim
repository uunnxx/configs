" Leader shortcuts for Rails commands
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

" au FileType rb nmap gd <Plug>(go-def)

" For Haml
" au! BufRead,BufNewFile *.haml         setfiletype haml

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <leader>e
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <leader>t
map <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Edit the README_FOR_APP (makes :R commands work)
map <leader>R :e doc/README_FOR_APP<CR>

augroup filetype_ruby
  autocmd!

  au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

  " Ruby.vim
  let ruby_operators = 1
  let ruby_space_errors = 1
  let ruby_fold = 1

augroup END

" Commented out because we can use NeoFormat for this action!
" Strip trailing whitespace (,ss)
" function! StripWhitespace () " {{{
"   let save_cursor = getpos(".")
"   let old_query = getreg('/')
"   :%s/\s\+$//e
"   call setpos('.', save_cursor)
"   call setreg('/', old_query)
" endfunction " }}}
" noremap <leader>ss :call StripWhitespace ()<CR>
