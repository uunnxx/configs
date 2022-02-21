local function map(kind, lhs, rhs, opts)
  vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end

local noremap = { noremap = true }
local nowait = { nowait = true }
local silentnoremap = { noremap = true, silent = true }
local silentnoremapnowait = { nowait = true, noremap = true, silent = true }


-- map('mode', 'map', 'action', {nowait = true, noremap = true, silent = true})

-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Useful remaps
map('i', 'eu', '<Esc>', silentnoremap)
map('n', ';', ':', silentnoremap)
map('x', ';', ':', silentnoremap)
map('n', '&', '%', silentnoremap)
map('x', '&', '%', silentnoremap)
map('n', "'", '`', silentnoremap)
map('n', '`', "'", silentnoremap)

-- Quicker way to open & close commands

map('n', '<leader>ww', ':update<CR>', silentnoremap)
map('n', '<space>qq', ':x<CR>', silentnoremap) -- <space> or <Space>
map('n', 'QQ', ':q<CR>', silentnoremap)
map('n', 'Qt', ':q!<CR>', silentnoremap)
map('n', 'Qa', ':qall<CR>', silentnoremap)
map('n', 'QA', ':qall!<CR>', silentnoremap)

-- Join lines and restore cursor location
map('n', 'J', 'mjJ`j', silentnoremap)


map('n', 'U', '<C-r>', silentnoremap)



-- TERMINAL SECTION:
map('n', '<space><space>t', ':split term://zsh<cr>', silentnoremap)
map('n', '<space><space>v', ':vsplit term://zsh<cr>', silentnoremap)


-- Use esc or ',,' to quit builtin terminal
-- tnoremap <esc>   <C-\><C-n>
map('t', '<leader><leader>', '<C-\\><C-n>', silentnoremap)
map('t', '<Esc>', '<C-\\><C-n>:q!<CR>', silentnoremapnowait)


-- Go to start or end of line easier
map('n', 'H', 'g0', silentnoremapnowait)
map('x', 'H', 'g0', silentnoremapnowait)
map('n', 'L', 'g_', silentnoremapnowait)
map('x', 'L', 'g_', silentnoremapnowait)


-- Find and replace
map('n', 'C-h', ":%s/\\C\\<<C-r><C-w>\\>//g<left><left>", silentnoremapnowait)
map('x', 'C-h', ':s/', silentnoremapnowait)
map('v', '<leader>*', '"hy:%s/\\V<C-r>h//g<left><left>', silentnoremapnowait)
-- nnoremap <nowait> <C-h> :%s/\C\<<C-r><C-w>\>//<left>
-- xnoremap <nowait> <C-h> :s/
-- vnoremap <leader>* "hy:%s/\V<C-r>h//<left>



-- System clipboard shift - y
map('v', 'S-y', '"+y', silentnoremap)
-- map('n', 'C-c', ':%y+<CR>', {noremap = true})





-- Arrow keys
--- map('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
--- map('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})
--- map('', '<left>', ':echoe "Use h"<CR>', {noremap = true, silent = false})
--- map('', '<right>', ':echoe "Use l"<CR>', {noremap = true, silent = false})

-- Autoformat + save as CTRL-s normal, and insert mode
map('n', '<C-s>', ':Autoformat<CR>:w<CR>',  silentnoremap)
map('i', '<C-s>', '<esc>:Autoformat<CR>:w<CR>', silentnoremap)


map('n', '<space>;', 'q:', noremap)
map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', noremap)


map('n', '<left>;', 'g;', noremap)
map('n', '<right>;', 'g,', noremap)


-- Simple way to move between windows
map('n', '\\', '<C-W>w', noremap)
map('n', '<space><space>w', '<C-W>x', silentnoremapnowait)
map('n', '<space>j', '<C-W>j', silentnoremapnowait)
map('n', '<space>k', '<C-W>k', silentnoremapnowait)
map('n', '<space>h', '<C-W>h', silentnoremapnowait)
map('n', '<space>l', '<C-W>l', silentnoremapnowait)

-- Move Window
map('n', '<space><space>j', '<C-W>J', silentnoremapnowait)
map('n', '<space><space>k', '<C-W>K', silentnoremapnowait)
map('n', '<space><space>h', '<C-W>H', silentnoremapnowait)
map('n', '<space><space>l', '<C-W>L', silentnoremapnowait)

-- Window resize
map('n', '<up>', ':resize +1<CR>', silentnoremap)
map('n', '<down>', ':resize -1<CR>', silentnoremap)
map('n', '<M-left>', ':vertical resize -1<CR>', silentnoremap)
map('n', '<M-right>', ':vertical resize +1<CR>', silentnoremap)

-- Split windows
map('n', '<leader><leader>v', '<C-W>v:Telescope find_files<CR>', silentnoremapnowait)
map('n', '<leader><leader>s', '<C-W>s:Telescope find_files<CR>', silentnoremapnowait)

-- Open files [ref. this]
map('n', '<M-t>', ':tabedit ', nowait)
map('i', '<M-t>', '<ESC>:tabedit ', nowait)
map('n', '<M-e>', ':edit ', nowait)
map('i', '<M-e>', '<ESC>:edit ', nowait)

map('n', 'tt', ':Telescope find_files<CR>', nowait)
-- map('n', '<C-CR>', ':Telescope find_files<CR>', nowait)
map('n', '<S-CR>', ':Telescope buffers theme=ivy<CR>', silentnoremapnowait)

-- Filetypes
map('n', 'FF', ':Telescope filetypes<CR>', silentnoremapnowait)

------------------ General
map('n', '<leader>R', ':redo<CR>', silentnoremap)

map('n', '<M-f>', ':Telescope live_grep<CR>', silentnoremap)
map('i', '<M-f>', '<C-o>:Telescope live_grep<CR>', silentnoremap)


-------------------- F-keys
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', silentnoremap)
map('i', '<F5>', '<C-o>:exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', silentnoremap)
map('n', '<F6>', ':set cursorline!<CR>', silentnoremap)
map('i', '<F6>', '<C-o>:set cursorline!<CR>', silentnoremap)
map('n', '<F7>', ':set list!<CR>', silentnoremap)
map('i', '<F7>', '<C-o>:set list!<CR>', silentnoremap)

map('n', '<F11>', ':set spell!<CR>', silentnoremap)
map('i', '<F11>', '<C-o>:set spell!<CR>', silentnoremap)


-- NvimTree
-- map('n', '<leader>nn', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', silentnoremap)
map('n', '<C-n>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', silentnoremapnowait)
map('i', '<C-n>', '<C-o>:NvimTreeRefresh<CR><C-o>:NvimTreeToggle<CR>', silentnoremapnowait)

-- tags
map('n', '<space>tg', ':Telescope tags<CR>', silentnoremap)
map('n', '<leader>tg', ':TagbarToggle<CR>', silentnoremap)


-- Move current line
map('i', '<down>', '<ESC>ddpi', silentnoremap)
map('i', '<up>', '<ESC>ddkPi', silentnoremap)


-- Go to file under cursor (vim default)
map('n', 'gf', '<C-]>', silentnoremap)

-- Back to location you were
map('n', '<BS>', '<C-o>', silentnoremap)

-- Switch between the last two files
-- map('n', '\|', '<C-^>', silentnoremap)
map('n', '|', '<C-^>', silentnoremap)



--------- Bufferline
map('n', '<Tab>', ':BufferLineCycleNext<CR>', silentnoremap)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', silentnoremap)


-- Clear highlight
map('n', '<C-l>', ':nohl<CR>', silentnoremapnowait)
map('i', '<C-l>', '<C-o>:nohl<CR>', silentnoremapnowait)


-- C-a C-x enumerate
map('n', '+', '<C-a>', silentnoremapnowait)
map('n', '-', '<C-x>', silentnoremapnowait)
map('v', '+', 'g<C-a>gv', silentnoremapnowait)
map('v', '-', 'g<C-x>gv', silentnoremapnowait)

-- Go to the starting position after visual modes
map('v', '<ESC>', 'o<ESC>', silentnoremap)


-- Highlight last inserted text
map('n', 'gV', '`[v`]', silentnoremap)


------------------------ Yank
-- copy entire file
map('n', '<C-c>', ':%y+<CR>', noremap)
map('i', '<C-c>', '<C-o>:%y+<CR>', noremap)

-- map('v', 'yy', '"+y', noremap)


-- Use gp and gP instead fo p and P to leave the cursor after the pasted text.
map('n', 'p', 'gp', silentnoremap)
map('n', 'P', 'gP', silentnoremap)
map('n', 'gp', 'p', silentnoremap)
map('n', 'gP', 'P', silentnoremap)







-------------------------------------------------------------------------------




-- map('n', '<Space>', '<PageDown> zz', silentnoremap)
-- map('n', '<C-Space>', '<PageUp> zz', silentnoremap)


-- shift + F1 = delete empty lines
-- map('n', '<S-F1>', ':g/^$/d<CR>', silentnoremap)

-- under cursor
-- map('n', '*', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], silentnoremap)

-- map('n', '#', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], silentnoremap)
