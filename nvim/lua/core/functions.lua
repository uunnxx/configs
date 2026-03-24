local M = {}

M.duplicate_and_comment = function()
	-- get the range
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")

	-- yank the selection
	vim.cmd(string.format("%d,%dyank", start_line, end_line))

	-- insert an empty line AFTER the end of the selection, not necessary!!!
	vim.fn.append(end_line, "")

	-- put the yanked content AFTER that new empty line, delete `...+1` in case deleting line above
	vim.cmd(string.format("%dput", end_line + 1))

	-- reselect and comment the original block
	local keys = vim.api.nvim_replace_termcodes("<Esc>gvgc", true, false, true)
	vim.api.nvim_feedkeys(keys, "x", false)
end

-- Return to last edit position when opening a file
vim.cmd([[
    augroup resume_edit_position
        autocmd!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                    \ | execute "normal! g`\"zvzz"
                    \ | endif
    augroup END
]])

-- Automatically reload the file if it is changed outside of Nvim, see
-- https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
-- command does not work in command line. We need to check if we are in command
-- line before executing this command. See also http://tinyurl.com/y6av4sy9.
vim.cmd([[
    augroup auto_read
        autocmd!
        autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
                    \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
        autocmd FileChangedShellPost * echohl WarningMsg
                    \ | echo "File changed on disk. Buffer reloaded!" | echohl None
    augroup END
]])

return M
