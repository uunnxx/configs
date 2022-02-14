local function map(kind, lhs, rhs, opts)
  vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end

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

map('n', '<leader>n', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', silentnoremap)


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






-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', silentnoremap)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', silentnoremap)

-- Пролистнуть на страницу вниз / вверх (как в браузерах)
map('n', '<Space>', '<PageDown> zz', silentnoremap)
map('n', '<C-Space>', '<PageUp> zz', silentnoremap)
-- fzf
map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], silentnoremap)
map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], silentnoremap)

-----------------------------------------------------------
-- Фн. клавиши по F1 .. F12
-----------------------------------------------------------
-- По F1 очищаем последний поиск с подсветкой
map('n', '<F1>', ':nohl<CR>', silentnoremap)
-- shift + F1 = удалить пустые строки
map('n', '<S-F1>', ':g/^$/d<CR>', silentnoremap)
-- <F2> для временной вставки из буфера, чтобы отключить авто идент
vim.o.pastetoggle='<F2>'
-- <F3> перечитать конфигурацию nvim Может не работать, если echo $TERM  xterm-256color
map('n', '<F3>', ':so ~/.config/nvim/init.lua<CR>:so ~/.config/nvim/lua/plugins.lua<CR>:so ~/.config/nvim/lua/settings.lua<CR>:so ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })
-- <S-F3> Открыть всю nvim конфигурацию для редактирования
map('n', '<S-F3>', ':e ~/.config/nvim/init.lua<CR>:e ~/.config/nvim/lua/plugins.lua<CR>:e ~/.config/nvim/lua/settings.lua<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })
-- <F4> Поиск слова под курсором
map('n', '<F4>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], silentnoremap)
-- <S-F4> Поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], silentnoremap)
-- <F5> разные вариации нумераций строк, можно переключаться
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', silentnoremap)
-- <F6> дерево файлов.
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F8>', ':TagbarToggle<CR>', silentnoremap)
-- <F11> Проверка орфографии  для русского и английского языка
map('n', '<F11>', ':set spell!<CR>', silentnoremap)
map('i', '<F11>', '<C-O>:set spell!<CR>', silentnoremap)
