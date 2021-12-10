" --- General functions and logics
"

" Relative line number toggle
function! NumberToggle()
  if(&rnu == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunction


function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'av'
    call CmdLine("Rg '" . l:pattern . "' ")
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/' . l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


augroup term_settings
  autocmd!
  " Do not use number and relative number for terminal inside nvim
  autocmd TermOpen * setlocal norelativenumber nonumber
  " Go to insert mode by default to start typing command
  autocmd TermOpen * startinsert
augroup END

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

" Return to last edit position when opening a file
augroup resume_edit_position
  autocmd!
  autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ | execute "normal! g`\"zvzz"
      \ | endif
augroup END

" Display a message when the current file is not in utf-8 format.
" Note that we need to use `unsilent` command here because of this issue:
" https://github.com/vim/vim/issues/4379
augroup non_utf8_file_warn
  autocmd!
  autocmd BufRead * if &fileencoding != 'utf-8'
              \ | unsilent echomsg 'FILE NOT IN UTF-8 FORMAT!' | endif
augroup END

" Automatically reload the file if it is changed outside of Nvim, see
" https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
" command does not work in command line. We need to check if we are in command
" line before executing this command. See also http://tinyurl.com/y6av4sy9.
augroup auto_read
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
              \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost * echohl WarningMsg
              \ | echo "File changed on disk. Buffer reloaded!" | echohl None
augroup END


function! UnMinify()
  %s/{\ze[^\r\n]/{\r/g
  %s/){/) {/g
  %s/};\?\ze[^\r\n]/\0\r/g
  %s/;\ze[^\r\n]/;\r/g
  %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
  normal ggVG=
endfunction


command! Prettify :call UnMinify()

" remove trailing white space
command! Nowhitespace :%s/\s\+$//

" remove blank lines
command! Noblanklines :g/^\s*$/d

" make current buffer executable
command! Chmodx :!chmod a+x %

function! AsciiMode()
  set nu!
  set virtualedit=all
  set colorcolumn=80
endfunction

command! Ascii :call AsciiMode()
