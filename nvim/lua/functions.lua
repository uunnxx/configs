-- Return to last edit position when opening a file
vim.cmd[[
    augroup resume_edit_position
        autocmd!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                    \ | execute "normal! g`\"zvzz"
                    \ | endif
    augroup END
]]


-- More accurate syntax highlighting? (see `:h syn-sync`)
vim.cmd[[
    augroup accurate_syn_highlight
        autocmd!
        autocmd BufEnter * :syntax sync fromstart
    augroup END
]]


-- Display a message when the current file is not in utf-8 format.
-- Note that we need to use `unsilent` command here because of this issue:
-- https://github.com/vim/vim/issues/4379
vim.cmd[[
    augroup non_utf8_file_warn
        autocmd!
        autocmd BufRead * if &fileencoding != 'utf-8'
                    \ | unsilent echomsg 'FILE NOT IN UTF-8 FORMAT!' | endif
    augroup END
]]


-- Automatically reload the file if it is changed outside of Nvim, see
-- https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
-- command does not work in command line. We need to check if we are in command
-- line before executing this command. See also http://tinyurl.com/y6av4sy9.
vim.cmd[[
    augroup auto_read
        autocmd!
        autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
                    \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
        autocmd FileChangedShellPost * echohl WarningMsg
                    \ | echo "File changed on disk. Buffer reloaded!" | echohl None
    augroup END
]]
