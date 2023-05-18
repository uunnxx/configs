local cmd  = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec   -- execute Vimscript
local g    = vim.g               -- global variables
-- local opt  = vim.opt             -- global/buffer/windows-scoped options

-- Tagbar
g.tagbar_compact = 1
g.tagbar_sort = 0

-- Remember last edit position
cmd [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]


-- highlight Yanks
exec(
    [[
        augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
        augroup end
    ]],
    false
)


-- Python
g.python3_host_prog = '/home/baka/venvs/neovim/bin/python'
