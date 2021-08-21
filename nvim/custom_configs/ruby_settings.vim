autocmd BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby
autocmd FileType ruby,eruby call RubyOptions()

function RubyOptions()

  inoremap ttH "#{}"<left><left>
  inoremap ttL #{}<left>
  inoremap ttP puts "#{}"<left><left>
  inoremap ppI puts %Q{  }<left><left>
  inoremap ppL puts %q{  }<left><left>

  nnoremap tH 0f#f{a
  nnoremap tL 0f#f}i

  imap TTT # => 

  " ruby_run plugin
  noremap <buffer> <silent> <space>rr :call RubyRun()<cr>
  vnoremap <buffer> <silent> <space>rr :call RubyRangeRun()<cr>

  " nnoremap ttL $F}i
  " nnoremap ttH 0f{a

  set iskeyword=@,!,?,48-57,192-255
  setlocal tags+=./tags;
  set tags+=/home/baka/.asdf/installs/ruby/3.0.2/lib/ruby/gems/3.0.0/gems/tags;


  " eRuby
  " Evaluate and print out: _erbout << something.to_s
  inoremap eH <%=  %><left><left><left>
  " Evaluate without printing out: something_else
  inoremap eL <%  %><left><left><left>
  " Comment
  inoremap eC <%#  %><left><left><left>

endfunction

" Ruby.vim
"
let ruby_operators = 1
let ruby_space_errors = 1
let ruby_fold = 1

" Ruby autocomplete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
