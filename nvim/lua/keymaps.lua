-------------------------------------------------------------------------------
-- map('mode', 'map', 'action', {nowait = bool, noremap = bool, silent = true})
--

local function map(kind, lhs, rhs, opts)
    vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end


local function map_with_desc(kind, lhs, rhs, base_opts, desc)
    local opts = vim.tbl_extend('force', base_opts, { desc = desc })
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
-- <C-t> is used for indenting as opposite of <C-d> in insert mode, so we can't use it
-- map('i', '<C-t>', '<Esc>', silentnoremap)

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


map_with_desc('n', '<leader>ww', ':update<CR>', noremap, 'Update/Save')
map_with_desc('i', '<leader>ww', '<C-o>:update<CR>', noremap, 'Update/Save in insert mode')
map_with_desc('n', '<space>qq', ':x<CR>', silentnoremap, 'Save and Quit')
map_with_desc('n', 'QQ', ':q<CR>', silentnoremap, 'Quit')
map_with_desc('n', 'Qt', ':q!<CR>', silentnoremap, 'QUIT!')
map_with_desc('n', 'Qa', ':qall<CR>', silentnoremap, 'Quit all')
map_with_desc('n', 'QA', ':qall!<CR>', silentnoremap, 'QUIT ALL!')

map_with_desc('n', 'J', 'mjJ`j', silentnoremap, 'Join lines and restore cursor location')


map_with_desc('n', 'U', '<C-r>', silentnoremap, 'Undo')
map_with_desc('n', '<leader>R', ':redo<CR>', silentnoremap, 'Redo')


-- Go to start or end of line easier
map('n', 'H', 'g^', silentnoremapnowait)
map('x', 'H', 'g^', silentnoremapnowait)
map('n', 'L', 'g_', silentnoremapnowait)
map('x', 'L', 'g_', silentnoremapnowait)


-- Find and replace
map_with_desc('n', '<C-h>', ':%s/\\C\\<<C-r><C-w>\\>//g<left><left>', noremapnowait, 'Find and Replace Current Word')
map_with_desc('x', '<C-h>', ':s/', noremapnowait, 'Find and Replace')
-- map('v', '<leader>*', '"hy:%s/\\V<C-r>h//g<left><left>', silentnoremapnowait)



-- Treat long lines as break lines unless we had count
-- I don't know how to get this effect in Lua
vim.cmd [[
    nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
    nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
]]



map('n', '<space>;', 'q:', noremap)
map_with_desc('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', noremap, 'PWD to current files directory/path')


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
map_with_desc('n', '<space><space>j', '<C-W>J', silentnoremapnowait, 'Move window down')
map_with_desc('n', '<space><space>k', '<C-W>K', silentnoremapnowait, 'Move window up')
map_with_desc('n', '<space><space>h', '<C-W>H', silentnoremapnowait, 'Move window left')
map_with_desc('n', '<space><space>l', '<C-W>L', silentnoremapnowait, 'Move window right')

-- Window resize
map_with_desc('n', '<up>', ':resize +1<CR>', silentnoremap, 'Horizontally resize window +1')
map_with_desc('n', '<down>', ':resize -1<CR>', silentnoremap, 'Horizontally resize window -1')
map_with_desc('n', '<M-left>', ':vertical resize -1<CR>', silentnoremap, 'Vertically resize window +1')
map_with_desc('n', '<M-right>', ':vertical resize +1<CR>', silentnoremap, 'Vertically resize window -1')

-- Open files [ref. this]
map_with_desc('n', '<M-t>', ':tabedit ', noremapnowait, 'Edit in new tab')
map_with_desc('i', '<M-t>', '<ESC>:tabedit ', noremapnowait, 'Edit in new tab [insert mode]')
map_with_desc('n', '<M-e>', ':edit ', noremapnowait, 'Edit [current buffer]')
map_with_desc('i', '<M-e>', '<ESC>:edit ', noremapnowait, 'Edit [current buffer: insert mode]')


-------------------------------------------------------------------------------
-- GENERAL
--

-- LSP
map_with_desc('n', 'gtd', ':Telescope lsp_definitions<CR>', silentnoremap, 'Go to Definitions')
map_with_desc('n', 'gtt', ':Telescope lsp_type_definitions<CR>', silentnoremap, 'Go to Type Definitions')
map_with_desc('n', 'gtr', ':Telescope lsp_references<CR>', silentnoremap, 'Go to References')
map_with_desc('n', 'gti', ':Telescope lsp_implementations<CR>', silentnoremap, 'Go to Implementations')

-- lsp show inlay hints
vim.keymap.set('n', '<leader>h', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)

-- Code Actions
map_with_desc('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', silentnoremap, 'Code Actions')


-- Telescope
map_with_desc('n', 'TT', ':Telescope ', noremap, 'Open Telescope')
map_with_desc('n', '<leader>gd', ':Telescope diagnostics<CR>', silentnoremap, 'Telescope Diagnostics')
map_with_desc('n', 'gst', ':Telescope git_status<CR>', silentnoremap, 'Telescope Git Status')
map_with_desc('n', '<leader>s', ':Telescope spell_suggest<CR>', silentnoremap, 'Telescope Spell Suggest')

-- Find Files
-- without preview
map_with_desc('n', 'tt', ':Telescope find_files hidden=true no_ignore=true<CR>', noremap, 'Telescope Find Files')
-- preview
map_with_desc('n', '<C-CR>', ':Telescope fd hidden=true no_ignore=true<CR>', noremapnowait, 'Telescope Find Files [preview]')
map_with_desc('n', '<S-CR>', ':Telescope buffers<CR>', silentnoremapnowait, 'Telescope Buffers')
map_with_desc('n', '<S-m>', ':Telescope man_pages sections=1,2,3<CR>', noremapnowait, 'Telescope Man Pages (sections: 1, 2, 3)')

-- Split windows
map_with_desc('n', '<leader><leader>v', '<C-W>v:Telescope find_files hidden=true no_ignore=true<CR>', silentnoremapnowait, 'Telescope Find Files [split virtically]')
map_with_desc('n', '<leader><leader>h', '<C-W>s:Telescope find_files hidden=true no_ignore=true<CR>', silentnoremapnowait, 'Telescope Find Files [split horizontally]')

-- Live Grep
map_with_desc('n', '<M-f>', ':Telescope live_grep theme=ivy<CR>', noremapnowait, 'Telescope Live Grep')
map_with_desc('i', '<M-f>', '<C-o>:Telescope live_grep theme=ivy<CR>', noremapnowait, 'Telescope Live Grep')

-- Filetypes
map_with_desc('n', 'FF', ':Telescope filetypes <CR>', noremapnowait, 'Telescope Select Filetypes')

-- Gitsigns
map_with_desc('n', 'git', ':Gitsigns<CR>', noremapnowait, 'Gitsigns')

-------------------------------------------------------------------------------

-- F-keys
-- map('n', '<F2>', ':source /home/baka/.config/nvim/source_me.lua<CR>', silentnoremap)

map_with_desc('n', '<F4>', ':set wrap!<CR>', noremap, 'Wrap')
map_with_desc('i', '<F4>', '<C-o>:set wrap!<CR>', noremap, 'Wrap [insert mode]')

map_with_desc('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', silentnoremap, 'Line Number')
map_with_desc('i', '<F5>', '<C-o>:exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', silentnoremap, 'Line Number [insert mode]')

map_with_desc('n', '<F6>', ':set cursorline!<CR>', silentnoremap, 'Cursorline')
map_with_desc('i', '<F6>', '<C-o>:set cursorline!<CR>', silentnoremap, 'Cursorline [insert mode]')

map_with_desc('n', '<F7>', ':set list!<CR>', silentnoremap, 'Show Hidden Symbols')
map_with_desc('i', '<F7>', '<C-o>:set list!<CR>', silentnoremap, 'Show Hidden Symbols [insert mode]')

map_with_desc('n', '<F8>', ':TagbarToggle<CR>', silentnoremap, 'Tagbar')
map_with_desc('i', '<F8>', '<C-o>:TagbarToggle<CR>', silentnoremap, 'Tagbar [insert mode]')

map_with_desc('n', '<F11>', ':set spell!<CR>', silentnoremap, 'Spell')
map_with_desc('i', '<F11>', '<C-o>:set spell!<CR>', silentnoremap, 'Spell [insert mode]')


-------------------------------------------------------------------------------

-- TAGS
map_with_desc('n', '<space>tg', ':Telescope tags<CR>', silentnoremap, 'Telescope Tags')

-- NvimTree
-- map('n', '<leader>nn', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', silentnoremap)
map_with_desc('n', '<C-n>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', silentnoremapnowait, 'Nvim Tree')
map_with_desc('i', '<C-n>', '<C-o>:NvimTreeRefresh<CR><C-o>:NvimTreeToggle<CR>', silentnoremapnowait, 'Nvim Tree [insert mode]')

map_with_desc('i', '<down>', '<ESC>ddpi', silentnoremap, 'Move current line down')
map_with_desc('i', '<up>', '<ESC>ddkPi', silentnoremap, 'Move current line up')
map_with_desc('n', 'gf', '<C-]>', silentnoremap, 'Go to file under cursor')
map_with_desc('n', '<BS>', '<C-o>', silentnoremap, 'Back to location you were')
map_with_desc('n', '|', '<C-^>', silentnoremap, 'Switch between the last two files')


--------- Bufferline
map_with_desc('n', '<Tab>', ':BufferLineCycleNext<CR>', silentnoremap, 'Buffer Next')
map_with_desc('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', silentnoremap, 'Buffer Previous')


-- Clear highlight
map_with_desc('n', '<C-l>', ':nohl<CR>', silentnoremapnowait, 'Clear Highlight')
map_with_desc('i', '<C-l>', '<C-o>:nohl<CR>', silentnoremapnowait, 'Clear Highlight')


-- C-a C-x enumerate
map('n', '+', '<C-a>', silentnoremapnowait)
map('n', '-', '<C-x>', silentnoremapnowait)
map('v', '+', 'g<C-a>gv', silentnoremapnowait)
map('v', '-', 'g<C-x>gv', silentnoremapnowait)


-- Go to the starting position after visual modes
map('v', '<ESC>', 'o<ESC>', silentnoremap)
map('v', 'v', 'o<ESC>', silentnoremap)

map_with_desc('n', 'gV', '`[v`]', silentnoremap, 'Highlight last inserted text')


------------------------ Yank
-- System clipboard shift - y
-- map('v', '<S-y>', '"+y', silentnoremap)

map_with_desc('n', '<C-c>', ':%y+<CR>', noremap, 'Copy Entire File')
map_with_desc('i', '<C-c>', '<C-o>:%y+<CR>', noremap, 'Copy Entire File [insert mode]')

map('n', 'Y', 'yy', noremap)
map('n', 'yy', 'y$', noremap)
-- map('v', 'yy', '"+y', noremap)


-- Use gp and gP instead fo p and P to leave the cursor after the pasted text.
map('n', 'p', 'gp', silentnoremap)
map('n', 'P', 'gP', silentnoremap)
map('n', 'gp', 'p', silentnoremap)
map('n', 'gP', 'P', silentnoremap)


-- Delete || change word separated by underscores or alternatively
--
-- some_word

map('n', 'du', 'dt_', noremap)
map('n', 'Du', 'df_', noremap)
map('n', 'cu', 'ct_', noremap)
map('n', 'Cu', 'cf_', noremap)

map('n', 'cU', 'F_lcw', noremap)
map('n', 'dU', 'F_de', noremap)


-------------------------------------------------------------------------------
-- CUSTOM KEYMAPS
--   Ruby:
--     test_array = ['text', 'hereb', 'text', 'hereb', 'text', 'hereb', 'text', 'hereb']
--     test_hash = {:foo => 'text', :bar => 2}
--     test_cmd = `command to execute`

-- Delete array|hash's first key/value
map('n', 'dcd', '0f[ldW', noremap)
map('n', 'dhd', '0f{ldf,x', noremap)
-- Delete array|hash's key/values but first
map('n', 'dcD', '0f[f,dt]', noremap)
map('n', 'dhD', '0f{f,dt}', noremap)

-- Change array|hash's first key/value
map('n', 'ccd', '0f[lcW', noremap)
map('n', 'chd', '0f{lct,', noremap)
-- Change array|hash's key/values but first
map('n', 'ccD', '0f[f,lct]', noremap)
map('n', 'chD', '0f{f,lct}', noremap)

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
map('n', 'dD', '0D', noremapnowait)
map('n', 'cC', '0C', noremapnowait)

-- Auto-center
map('n', 'G', 'Gzz', silentnoremap)
map('n', 'n', 'nzz', silentnoremap)
map('n', 'N', 'Nzz', silentnoremap)
map('n', '}', '}zz', silentnoremapnowait)
map('n', '{', '{zz', silentnoremapnowait)


-- map('n', '^', 'g^', silentnoremap)
map('n', '0', 'g0', silentnoremap)


map_with_desc('n', '<leader><leader><space>', ':bd<CR>', silentnoremap, 'Close current buffer')
map_with_desc('n', '<leader><leader>w', ':%bd <bar> e# <bar> bd#<CR>', silentnoremap, 'Close all buffers but current')

map_with_desc('i', '<leader><leader>l', '<C-x><C-l>', noremapnowait, 'Line autocompletion')

map_with_desc('n', '<leader>m', ':HopWord<CR>', noremap, 'Hop to word')
map_with_desc('n', '<leader>gg', ':HopLine<CR>', noremap, 'Hop to line')

-------------------------------------------------------------------------------
-- TERMINAL SECTION:
--
map_with_desc('n', '<space><space>t', ':split term://zsh<CR>a', silentnoremap, 'Horizontal Terminal')
map_with_desc('n', '<space><space>v', ':vsplit term://zsh<CR>a', silentnoremap, 'Vertical Terminal')

map_with_desc('t', '<leader><leader>', '<C-\\><C-n>', noremapnowait, 'Normal mode in Terminal')
map_with_desc('t', '<Esc><Esc>', '<C-\\><C-n>:q!<CR>', noremapnowait, 'Close Terminal')


-------------------------------------------------------------------------------
-- Debugging
-- map('n', '<leader>db', ':lua require("dapui").toggle()<CR>', silentnoremap)
-- map('n', '<leader>df', ':lua require("dapui").float_element()<CR>', silentnoremap)
-- map('v', '<M-k>', ':lua require("dapui").eval()<CR>', silentnoremap)


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


vim.cmd [[
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
vim.cmd [[
    autocmd FileType markdown,md,rb call MarkdownOptions()

    function! MarkdownOptions()
        nmap Th [\|
        nmap Tl ]\|
        nmap Tj }\|
        nmap Tk {\|
    endfunction
]]


-- Python custom keymaps
vim.cmd [[
    autocmd FileType python,py call PythonOptions()

    function! PythonOptions()
        imap ttL print()<left>
        imap ttD print(f"{=}")<left><left><left><left>
        imap ttF print(f"{}")<left><left><left>
    endfunction
]]


-- Ruby custom keymaps
vim.cmd [[
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
vim.cmd [[
    " Quickly jump to header or source file
    " This technique can probably be applied to many filetypes.
    " It sets file marks (see :h marks) when leaving a source or header file,
    " so you can quickly jump back to the last accessed one
    " by using 'C or 'H (see :h 'A).


    " NOTE: The info is saved in the viminfo file, so make sure that
    " :set viminfo? includes :h viminfo-'.
    " viminfo is shaDa in neovim. see: :h shada-

    autocmd FileType cpp,c call CppCOptions()

    function! CppCOptions()
        autocmd FileType *.{cpp,c} mark C
        autocmd FileType *.h mark H

        " inoremap <buffer> iinc #include <><left>
        " inoremap <buffer> innc #include ""<left>
        inoremap TTT # =>

        " inoremap ttP print('')<left><left>
        " inoremap ttL print()<left>

        " nnoremap tH 0f#f{a
        " nnoremap tL 0f#f}i


    endfunction
]]


-------------------------------------------------------------------------------

-- Autoformat + save as CTRL-s normal, and insert mode
-- map('n', '<C-s>', ':Autoformat<CR>', silentnoremap)
-- map('i', '<C-s>', '<C-o>:Autoformat<CR>', silentnoremap)

-- replaced with new plugin: conform

vim.keymap.set({ "n", "v" }, "<C-s>", function()
    require("conform").format({ async = true, lsp_fallback = true }, function(err)
        if not err then
            -- If we formatted in visual mode, escape to normal mode after formatting
            if vim.startswith(vim.api.nvim_get_mode().mode:lower(), "v") then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            end
        end
    end)
end, { desc = "Format buffer" })
