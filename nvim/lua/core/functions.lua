local M = {}

M.duplicate_and_comment = function()
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")

	vim.cmd(string.format("%d,%dyank", start_line, end_line))
	vim.fn.append(end_line, "")
	vim.cmd(string.format("%dput", end_line + 1))

	local keys = vim.api.nvim_replace_termcodes("<Esc>gvgc", true, false, true)
	vim.api.nvim_feedkeys(keys, "x", false)
end


M.toggle_word = function()
	local toggles = {
		["true"] = "false",
		["True"] = "False",
		["TRUE"] = "FALSE",
		["always"] = "never",
		["yes"] = "no",
		["1"] = "0",
		["on"] = "off",
		["&&"] = "||",
		["and"] = "or",
		["+"] = "-",
		["<"] = ">",
		["<="] = ">=",
		["let"] = "const",
	}

	local cword = vim.fn.expand("<cword>")
	local new_word
	for word, opposite in pairs(toggles) do
		if cword == word then
			new_word = opposite
		end
		if cword == opposite then
			new_word = word
		end
	end
	if new_word then
		local prev_cursor = vim.api.nvim_win_get_cursor(0)
		vim.cmd.normal({ '"_ciw' .. new_word, bang = true })
		vim.api.nvim_win_set_cursor(0, prev_cursor)
	end
end


return M
