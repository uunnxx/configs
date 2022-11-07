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


-- Default remaps
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
map('n', '<leader>R', ':redo<CR>', silentnoremap)



--------------------
-- TERMINAL SECTION:
--------------------
map('n', '<space><space>t', ':split term://zsh<cr>a', silentnoremap)
map('n', '<space><space>v', ':vsplit term://zsh<cr>a', silentnoremap)


-- Use esc or ',,' to quit builtin terminal
-- tnoremap <esc>   <C-\><C-n>
map('t', '<leader><leader>', '<C-\\><C-n>', silentnoremap)
map('t', '<Esc><Esc>', '<C-\\><C-n>:q!<CR>', silentnoremapnowait)

--------------------------
-- END OF TERMINAL SECTION
--------------------------


-- Go to start or end of line easier
map('n', 'H', 'g0', silentnoremapnowait)
map('x', 'H', 'g0', silentnoremapnowait)
map('n', 'L', 'g_', silentnoremapnowait)
map('x', 'L', 'g_', silentnoremapnowait)


-- Find and replace
map('n', '<C-h>', ':%s/\\C\\<<C-r><C-w>\\>//g<left><left>', silentnoremapnowait)
map('x', '<C-h>', ':s/', silentnoremapnowait)
-- map('v', '<leader>*', '"hy:%s/\\V<C-r>h//g<left><left>', silentnoremapnowait)



-- Treat long lines as break lines unless we had count
-- I don't know how to get this effect in Lua
vim.cmd[[
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
]]


-----------------------------------------------------------------------------

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

-- Open files [ref. this]
map('n', '<M-t>', ':tabedit ', nowait)
map('i', '<M-t>', '<ESC>:tabedit ', nowait)
map('n', '<M-e>', ':edit ', nowait)
map('i', '<M-e>', '<ESC>:edit ', nowait)

--------------------------
------------------ GENERAL
--------------------------
-- LSP
-- map('n', 'G', 'Gzz', silentnoremap)
map('n', 'gtd', ':Telescope lsp_definitions<CR>', silentnoremap)
map('n', 'gtt', ':Telescope lsp_type_definitions<CR>', silentnoremap)
map('n', 'gtr', ':Telescope lsp_references<CR>', silentnoremap)
map('n', 'gti', ':Telescope lsp_implementations<CR>', silentnoremap)


-- Telescope
map('n', 'TT', ':Telescope ', noremap)
map('n', 'gD', ':Telescope diagnostics<CR>', silentnoremap)
map('n', 'gst', ':Telescope git_status<CR>', silentnoremap)

map('n', '<leader>s', ':Telescope spell_suggest<CR>', silentnoremap)

-- Find Files
-- without preview
map('n', 'tt', ':Telescope find_files theme=ivy<CR>', nowait)
-- preview
map('n', '<C-CR>', ':Telescope fd theme=dropdown<CR>', nowait)
-- Buffers
map('n', '<S-CR>', ':Telescope buffers theme=ivy<CR>', silentnoremapnowait)

map('n', '<S-m>', ':Telescope man_pages sections=1,2,3<CR>', silentnoremapnowait)

-- Split windows
map('n', '<leader><leader>v', '<C-W>v:Telescope find_files theme=ivy<CR>', silentnoremapnowait)
map('n', '<leader><leader>s', '<C-W>s:Telescope find_files theme=ivy<CR>', silentnoremapnowait)

-- Live Grep
map('n', '<M-f>', ':Telescope live_grep theme=ivy<CR>', silentnoremap)
map('i', '<M-f>', '<C-o>:Telescope live_grep theme=ivy<CR>', silentnoremap)

-- Filetypes
map('n', 'FF', ':Telescope filetypes <CR>', silentnoremapnowait)






------------------ F-keys
map('n', '<F2>', ':source /home/baka/.config/nvim/source_me.lua<CR>', silentnoremap)

map('n', '<F4>', ':set wrap!<CR>', noremap)
map('i', '<F4>', '<C-o>:set wrap!<CR>', noremap)

map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', silentnoremap)
map('i', '<F5>', '<C-o>:exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', silentnoremap)

map('n', '<F6>', ':set cursorline!<CR>', silentnoremap)
map('i', '<F6>', '<C-o>:set cursorline!<CR>', silentnoremap)

map('n', '<F7>', ':set list!<CR>', silentnoremap)
map('i', '<F7>', '<C-o>:set list!<CR>', silentnoremap)

map('n', '<F8>', ':TagbarToggle<CR>', silentnoremap)
map('i', '<F8>', '<C-o>:TagbarToggle<CR>', silentnoremap)

map('n', '<F11>', ':set spell!<CR>', silentnoremap)
map('i', '<F11>', '<C-o>:set spell!<CR>', silentnoremap)


-- TAGS
map('n', '<space>tg', ':Telescope tags theme=ivy<CR>', silentnoremap)

-- NvimTree
-- map('n', '<leader>nn', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', silentnoremap)
map('n', '<C-n>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', silentnoremapnowait)
map('i', '<C-n>', '<C-o>:NvimTreeRefresh<CR><C-o>:NvimTreeToggle<CR>', silentnoremapnowait)



-- Move current line
map('i', '<down>', '<ESC>ddpi', silentnoremap)
map('i', '<up>', '<ESC>ddkPi', silentnoremap)


-- Go to file under cursor (vim default)
map('n', 'gf', '<C-]>', silentnoremap)

-- Back to location you were
map('n', '<BS>', '<C-o>', silentnoremap)

-- Switch between the last two files
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
map('v', 'v', 'o<ESC>', silentnoremap)


-- Highlight last inserted text
map('n', 'gV', '`[v`]', silentnoremap)


------------------------ Yank
-- System clipboard shift - y
-- map('v', '<S-y>', '"+y', silentnoremap)

-- copy entire file
map('n', '<C-c>', ':%y+<CR>', noremap)
map('i', '<C-c>', '<C-o>:%y+<CR>', noremap)

map('n', 'Y', 'yy', noremap)
map('n', 'yy', 'y$', noremap)
-- map('v', 'yy', '"+y', noremap)


-- Use gp and gP instead fo p and P to leave the cursor after the pasted text.
map('n', 'p', 'gp', silentnoremap)
map('n', 'P', 'gP', silentnoremap)
map('n', 'gp', 'p', silentnoremap)
map('n', 'gP', 'P', silentnoremap)


-- Delete || change word separated by underscores or alternatively

map('n', 'du', 'dt_', silentnoremap)
map('n', 'Du', 'df_', silentnoremap)
map('n', 'cu', 'ct_', silentnoremap)
map('n', 'Cu', 'cf_', silentnoremap)

map('n', 'cU', 'df_ldea', silentnoremap)
map('n', 'dU', 'bf_de', silentnoremap)


-- FOR_EDU:
--   Ruby:
--     test_array = ['text', 'hereb', 'text', 'hereb', 'text', 'hereb', 'text', 'hereb']
--     test_hash = {:foo => 'text', :bar => 2}
--     test_cmd = `command to execute`
--
-- Delete array|hash's first key/value
map('n', 'dcd', '0f[ldW', noremap )
map('n', 'dhd', '0f{ldf,x', noremap )
-- Delete array|hash's key/values but first
map('n', 'dcD', '0f[f,dt]', noremap )
map('n', 'dhD', '0f{f,dt}', noremap )
--
-- Change array|hash's first key/value
map('n', 'ccd', '0f[lcW', noremap )
map('n', 'chd', '0f{lct,', noremap )
-- Change array|hash's key/values but first
map('n', 'ccD', '0f[f,lct]', noremap )
map('n', 'chD', '0f{f,lct}', noremap )
--
-- " def main(arg, arg2)
-- "   do_something
-- " end


-- VIM core functionality (as example):
--   cib => ci(
--   cab => ca(
--   ciB => ci{
--   caB => ca{

-- CUSTOM MAPS:
--   Because of dvp keyboard layout I don't know the exact place of the
--   key [] and it's hard to press `

--     cid => ci[
--     cad => ca[
--     ciD => ci`
--     caD => ca`

--     did => di[
--     dad => da[
--     diD => di`
--     daD => da`

--     vid => vi[
--     vad => va[
--     viD => vi`
--     vaD => va`

--     yid => yi[
--     yad => ya[
--     yiD => yi`
--     yaD => ya`

map('n', 'cid', 'ci[', noremap)
map('n', 'cad', 'ca[', noremap)
map('n', 'ciD', 'ci`', noremap)
map('n', 'caD', 'ca`', noremap)

map('n', 'did', 'di[', noremap)
map('n', 'dad', 'da[', noremap)
map('n', 'diD', 'di`', noremap)
map('n', 'daD', 'da`', noremap)

map('n', 'vid', 'vi[', noremap)
map('n', 'vad', 'va[', noremap)
map('n', 'viD', 'vi`', noremap)
map('n', 'vaD', 'va`', noremap)

map('n', 'yid', 'yi[', noremap)
map('n', 'yad', 'ya[', noremap)
map('n', 'yiD', 'yi`', noremap)
map('n', 'yaD', 'ya`', noremap)



-- Change text _without putting the text into register,
-- see http://tinyurl.com/y2ap4h69
map('n', 'c', '"_c', noremap)
map('n', 'C', '"_C', noremap)
map('n', 'cc', '"_cc', noremap)


-- Empty || Change current line
map ('n', 'dD', 'I<ESC>D', silentnoremapnowait)
map ('n', 'cC', 'I<ESC>C', silentnoremapnowait)

-- Auto-center
map('n', 'G', 'Gzz', silentnoremap)
map('n', 'n', 'nzz', silentnoremap)
map('n', 'N', 'Nzz', silentnoremap)
map('n', '}', '}zz', silentnoremapnowait)
map('n', '{', '{zz', silentnoremapnowait)


-- map('n', '^', 'g^', silentnoremap)
map('n', '0', 'g0', silentnoremap)


-- Close buffers
map('n', '<leader><leader><space>', ':%bd <bar> e# <bar> bd#<cr>', silentnoremap)


-- Line autocompletion
map('i', '<leader><leader>l', '<C-x><C-l>', silentnoremap)



-------------------------------------------------------------------------------


-- shift + F1 = delete empty lines
-- map('n', '<S-F1>', ':g/^$/d<CR>', silentnoremap)


vim.cmd[[
  " Run code w/o arg  <leader>rr
  " Run with argument <leader>rc
  autocmd FileType ruby    nmap <buffer> <leader>rr :w\|:!ruby ./%<cr>
  autocmd FileType ruby    nmap <buffer> <leader>rc :w\|:!ruby ./% 
  autocmd FileType javascript    nmap <buffer> <leader>rr :w\|:!node ./%<cr>
  autocmd FileType javascript    nmap <buffer> <leader>rc :w\|:!node ./% 
  autocmd FileType crystal nmap <buffer> <leader>rr :w\|:!crystal ./%<cr>
  autocmd FileType crystal nmap <buffer> <leader>rc :w\|:!crystal ./% 
  autocmd FileType python  nmap <buffer> <leader>rr :w\|:!python3 ./%<cr>
  autocmd FileType python  nmap <buffer> <leader>rc :w\|:!python3 ./% 
  autocmd FileType cpp     nmap <buffer> <leader>rr :w\|:!g++ ./% -g -o %:r_temp && ./%:r_temp<cr>
  autocmd FileType cpp     nmap <buffer> <leader>rc :w\|:!g++ ./% -g -o %:r_temp && ./%:r_temp 
  autocmd FileType c       nmap <buffer> <leader>rr :w\|:!gcc ./% -g -o %:r_temp && ./%:r_temp<cr>
  autocmd FileType c       nmap <buffer> <leader>rc :w\|:!gcc ./% -g -o %:r_temp && ./%:r_temp 
]]


-- Table mode custom keymaps
vim.cmd[[
  autocmd FileType markdown,md,rb call MarkdownOptions()

  function! MarkdownOptions()
    nmap Th [\|
    nmap Tl ]\|
    nmap Tj }\|
    nmap Tk {\|

  endfunction
]]


-- Python custom keymaps
vim.cmd[[
  autocmd FileType python,py call PythonOptions()

  function! PythonOptions()
    imap ttL print()<left>
  endfunction
]]
