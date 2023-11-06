-------------------------------------------------------------------------------
-- map('mode', 'map', 'action', {nowait = bool, noremap = bool, silent = true})
--

local function map(kind, lhs, rhs, opts)
    vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end

local noremap = { noremap = true }
local noremapnowait = { noremap = true, nowait = true }
local silentnoremap = { noremap = true, silent = true }
local silentnoremapnowait = { nowait = true, noremap = true, silent = true }



-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","


-------------------------------------------------------------------------------
-- DEFAULT REMAPS
--
map('i', 'eu', '<Esc>', silentnoremap)

-- For the sake of in case ; mapped to :
-- Repeat latest f, t, F or T [count] times. See |cpo-;|
-- Opposite to this is ,
map('n', ';', ':', noremap)
map('x', ';', ':', noremap)
map('n', ':', ';', noremap)
map('x', ':', ';', noremap)

map('n', '&', '%', noremap)
map('x', '&', '%', noremap)
map('n', "'", '`', noremap)
map('n', '`', "'", noremap)


map('n', '<leader>ww', ':update<CR>', noremap)
map('i', '<leader>ww', '<C-o>:update<CR>', noremap)
map('n', '<space>qq', ':x<CR>', silentnoremap)
map('n', 'QQ', ':q<CR>', silentnoremap)
map('n', 'Qt', ':q!<CR>', silentnoremap)
map('n', 'Qa', ':qall<CR>', silentnoremap)
map('n', 'QA', ':qall!<CR>', silentnoremap)


-- Join lines and restore cursor location
map('n', 'J', 'mjJ`j', silentnoremap)


map('n', 'U', '<C-r>', silentnoremap)
map('n', '<leader>R', ':redo<CR>', silentnoremap)


-- Go to start or end of line easier
map('n', 'H', 'g^', silentnoremapnowait)
map('x', 'H', 'g^', silentnoremapnowait)
map('n', 'L', 'g_', silentnoremapnowait)
map('x', 'L', 'g_', silentnoremapnowait)


-- Find and replace
map('n', '<C-h>', ':%s/\\C\\<<C-r><C-w>\\>//g<left><left>', noremapnowait)
map('x', '<C-h>', ':s/', noremapnowait)
-- map('v', '<leader>*', '"hy:%s/\\V<C-r>h//g<left><left>', silentnoremapnowait)



-- Treat long lines as break lines unless we had count
-- I don't know how to get this effect in Lua
vim.cmd[[
    nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
    nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
]]


-------------------------------------------------------------------------------

-- Autoformat + save as CTRL-s normal, and insert mode
map('n', '<C-s>', ':Autoformat<CR>',  silentnoremap)
map('i', '<C-s>', '<C-o>:Autoformat<CR>', silentnoremap)


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
map('t', '\\', '<C-\\><C-n><C-W>w', silentnoremap)

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
map('n', '<M-t>', ':tabedit ', noremapnowait)
map('i', '<M-t>', '<ESC>:tabedit ', noremapnowait)
map('n', '<M-e>', ':edit ', noremapnowait)
map('i', '<M-e>', '<ESC>:edit ', noremapnowait)


-------------------------------------------------------------------------------
-- GENERAL
--

-- LSP
-- map('n', 'G', 'Gzz', silentnoremap)
map('n', 'gtd', ':Telescope lsp_definitions<CR>', silentnoremap)
map('n', 'gtt', ':Telescope lsp_type_definitions<CR>', silentnoremap)
map('n', 'gtr', ':Telescope lsp_references<CR>', silentnoremap)
map('n', 'gti', ':Telescope lsp_implementations<CR>', silentnoremap)


-- Trouble
map('n', 'gT', ':TroubleToggle<CR>', silentnoremap)
map("n", 'gR', ":TroubleToggle lsp_references<cr>", {silent = true, noremap = true})
map("n", '<space>xw', ':TroubleToggle workspace_diagnostics<cr>', silentnoremap)
map("n", '<space>xd', ':TroubleToggle document_diagnostics<cr>', silentnoremap)
map("n", '<space>xl', ':TroubleToggle loclist<cr>', silentnoremap)
map("n", '<space>xq', ':TroubleToggle quickfix<cr>', silentnoremap)


-- Telescope
map('n', 'TT', ':Telescope ', noremap)
map('n', '<leader>gd', ':Telescope diagnostics<CR>', silentnoremap)
map('n', 'gst', ':Telescope git_status<CR>', silentnoremap)
map('n', '<leader>s', ':Telescope spell_suggest<CR>', silentnoremap)

-- Find Files
-- without preview
map('n', 'tt', ':Telescope find_files hidden=true<CR>', noremap)
-- preview
map('n', '<C-CR>', ':Telescope fd hidden=true<CR>', noremapnowait)
map('n', '<S-CR>', ':Telescope buffers<CR>', silentnoremapnowait)
map('n', '<S-m>', ':Telescope man_pages sections=1,2,3<CR>', noremapnowait)

-- Split windows
map('n', '<leader><leader>v', '<C-W>v:Telescope find_files hidden=true<CR>', silentnoremapnowait)
map('n', '<leader><leader>h', '<C-W>s:Telescope find_files hidden=true<CR>', silentnoremapnowait)

-- Live Grep
map('n', '<M-f>', ':Telescope live_grep theme=ivy<CR>', noremapnowait)
map('i', '<M-f>', '<C-o>:Telescope live_grep theme=ivy<CR>', noremapnowait)

-- Filetypes
map('n', 'FF', ':Telescope filetypes <CR>', noremapnowait)


-------------------------------------------------------------------------------

-- F-keys
-- map('n', '<F2>', ':source /home/baka/.config/nvim/source_me.lua<CR>', silentnoremap)

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


-------------------------------------------------------------------------------

-- TAGS
map('n', '<space>tg', ':Telescope tags<CR>', silentnoremap)

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

map('n', 'du', 'dt_', noremap)
map('n', 'Du', 'df_', noremap)
map('n', 'cu', 'ct_', noremap)
map('n', 'Cu', 'cf_', noremap)

map('n', 'cU', 'df_ldea', noremap)
map('n', 'dU', 'bf_de', noremap)


-------------------------------------------------------------------------------
-- CUSTOM KEYMAPS
--   Ruby:
--     test_array = ['text', 'hereb', 'text', 'hereb', 'text', 'hereb', 'text', 'hereb']
--     test_hash = {:foo => 'text', :bar => 2}
--     test_cmd = `command to execute`

-- Delete array|hash's first key/value
map('n', 'dcd', '0f[ldW', noremap )
map('n', 'dhd', '0f{ldf,x', noremap )
-- Delete array|hash's key/values but first
map('n', 'dcD', '0f[f,dt]', noremap )
map('n', 'dhD', '0f{f,dt}', noremap )

-- Change array|hash's first key/value
map('n', 'ccd', '0f[lcW', noremap )
map('n', 'chd', '0f{lct,', noremap )
-- Change array|hash's key/values but first
map('n', 'ccD', '0f[f,lct]', noremap )
map('n', 'chD', '0f{f,lct}', noremap )

-- " def main(arg, arg2)
-- "   do_something
-- " end


-- VIM core functionality (as example):
--   cib => ci(
--   cab => ca(
--   ciB => ci{
--   caB => ca{
--
--   dib => di(
--   dab => da(
--   diB => di{
--   daB => da{
--
--   vib => vi(
--   vab => va(
--   viB => vi{
--   vaB => va{

--   yib => yi(
--   yab => ya(
--   yiB => yi{
--   yaB => ya{


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
map('n', 'c', '"_c', noremap)
map('n', 'C', '"_C', noremap)
map('n', 'cc', '"_cc', noremap)


-- Empty || Change current line
map ('n', 'dD', '0D', noremapnowait)
map ('n', 'cC', '0C', noremapnowait)

-- Auto-center
map('n', 'G', 'Gzz', silentnoremap)
map('n', 'n', 'nzz', silentnoremap)
map('n', 'N', 'Nzz', silentnoremap)
map('n', '}', '}zz', silentnoremapnowait)
map('n', '{', '{zz', silentnoremapnowait)


-- map('n', '^', 'g^', silentnoremap)
map('n', '0', 'g0', silentnoremap)


-- Close buffers
map('n', '<leader><leader><space>', ':%bd <bar> e# <bar> bd#<CR>', silentnoremap)


-- Line autocompletion
map('i', '<leader><leader>l', '<C-x><C-l>', noremapnowait)


-- HOP
map('n', '<leader>m', ':HopWord<CR>', noremap)
map('n', '<leader>gg', ':HopLine<CR>', noremap)

-------------------------------------------------------------------------------
-- TERMINAL SECTION:
--
map('n', '<space><space>t', ':split term://zsh<CR>a', silentnoremap)
map('n', '<space><space>v', ':vsplit term://zsh<CR>a', silentnoremap)


-- Use esc or ',,' to quit builtin terminal
-- tnoremap <esc>   <C-\><C-n>
map('t', '<leader><leader>', '<C-\\><C-n>', noremapnowait)
map('t', '<Esc><Esc>', '<C-\\><C-n>:q!<CR>', noremapnowait)


-- Toggle relative line number
-- map('n', '<C-l><C-l>', ':set invrelativenumber<CR>', silentnoremap)
-- map('i', '<C-l><C-l>', '<C-o>:set invrelativenumber<CR>', silentnoremap)


-------------------------------------------------------------------------------
-- Debugging
-- map('n', '<leader>db', ':lua require("dapui").toggle()<CR>', silentnoremap)
-- map('n', '<leader>df', ':lua require("dapui").float_element()<CR>', silentnoremap)
-- map('v', '<M-k>', ':lua require("dapui").eval()<CR>', silentnoremap)


-------------------------------------------------------------------------------
-- LeetCode
-- map('n', '<leader>lq', ':LBQuestions<CR>', silentnoremap)


-------------------------------------------------------------------------------


-- shift + F1 = delete empty lines
-- map('n', '<S-F1>', ':g/^$/d<CR>', silentnoremap)

-- local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- autocmd(
--     "Filetype", {
--         pattern = { 'python', 'py' },
--         command = [[nnoremap <buffer> ,rr :w<CR>:python %<CR>]]
--     }
-- )


vim.cmd[[
    " ; -> :
    " because of the map('n', ';', ':', noremap)
    autocmd FileType ruby          nmap <buffer> ,rr ;w\|:!ruby %:p<CR>
    autocmd FileType ruby          nmap <buffer> ,rc ;w\|:!ruby %:p

    autocmd FileType javascript    nmap <buffer> ,rr ;w\|:!node %:p<CR>
    autocmd FileType javascript    nmap <buffer> ,rc ;w\|:!node %:p

    autocmd FileType crystal       nmap <buffer> ,rr ;w\|:!crystal %:p<CR>
    autocmd FileType crystal       nmap <buffer> ,rc ;w\|:!crystal %:p

    autocmd FileType python        nmap <buffer> ,rr ;w\|:!python %:p<CR>
    autocmd FileType python        nmap <buffer> ,rc ;w\|:!python %:p

    autocmd FileType cpp           nmap <buffer> ,rr ;w\|:!g++ %:p -g -o %:p:r_temp && %:p:r_temp<CR>
    autocmd FileType cpp           nmap <buffer> ,rc ;w\|:!g++ %:p -g -o %:p:r_temp && %:p:r_temp

    autocmd FileType c             nmap <buffer> ,rr ;w\|:!gcc %:p -g -o %:p:r_temp && %:p:r_temp<CR>
    autocmd FileType c             nmap <buffer> ,rc ;w\|:!gcc %:p -g -o %:p:r_temp && %:p:r_temp

    autocmd FileType sh            nmap <buffer> ,rr ;w\|:!%:p<CR>
    autocmd FileType sh            nmap <buffer> ,rc ;w\|:!%:p
]]


-- Table mode custom keymaps
-- set keywordprg=trans\ :jp
-- <S-k> to trans current word under cursor
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
        imap ttD print(f"{=}")<left><left><left><left>
        imap ttF print(f"{}")<left><left><left>
    endfunction
]]


-- Ruby custom keymaps
vim.cmd[[
    autocmd BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby
    autocmd FileType ruby,eruby call RubyOptions()

    function! RubyOptions()
        imap ttH "#{}"<left><left>
        imap ttL #{}<left>
        imap ttP puts "#{}"<left><left>
        imap ppI puts %Q{  }<left><left>
        imap ppL puts %q{  }<left><left>

        nmap tH 0f#f{a
        nmap tL 0f#f}i

        imap TTT # => 


        " nnoremap ttL $F}i
        " nnoremap ttH 0f{a

        set iskeyword=@,!,?,_,48-57,192-255

        set tags+=./tags


        " eRuby
        " Evaluate and print out: _erbout << something.to_s
        imap eHH <%=  %><left><left><left>
        " Evaluate without printing out: something_else
        imap eLL <%  %><left><left><left>
        " Comment
        imap eCC <%#  %><left><left><left>
    endfunction
]]


-- C++ & C custom keymaps
vim.cmd[[
    " Quickly jump to header or source file
    " This technique can probably be applied to many filetypes.
    " It sets file marks (see :h marks) when leaving a source or header file,
    " so you can quickly jump back to the last accessed one
    " by using 'C or 'H (see :h 'A).


    " NOTE: The info is saved in the viminfo file, so make sure that
    " :set viminfo? includes :h viminfo-'.

    autocmd FileType *.{cpp,c} mark C
    autocmd FileType *.h mark H
    autocmd FileType cpp,c call CppCOptions()

    function! CppCOptions()

        " inoremap <buffer> iinc #include <><left>
        " inoremap <buffer> innc #include ""<left>
        inoremap TTT # => 

        " inoremap ttP print('')<left><left>
        " inoremap ttL print()<left>

        " nnoremap tH 0f#f{a
        " nnoremap tL 0f#f}i


    endfunction
]]
