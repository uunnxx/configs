local set = vim.opt -- global/buffer/windows-scoped options
local cmd = vim.cmd -- execute Vim commands
local fn = vim.fn --
local wset = vim.wo -- Window-scoped
local g = vim.g -- Global
local exec = vim.api.nvim_exec -- execute Vimscript
-- local bset  = vim.bo              -- Buffer-scoped

vim.o.background = "dark"
cmd("colorscheme gruvbox")

-- cmd [[
-- packadd termdebug
-- packadd shellmenu
-- ]]
cmd([[
    packadd nvim.undotree
    packadd matchit
]])

-- Tagbar
g.tagbar_compact = 1
g.tagbar_sort = 0

-- Python
g.python3_host_prog = "/home/baka/venvs/neovim/bin/python"

g.loaded_synload = 1
g.loaded_matchparen = 1
g.matchparen_timeout = 2
g.matchparen_insert_timeout = 2

-- disable netrw [disabling it will block some plugins, like open in Browser]
-- g.loaded_netrw =  1
-- g.loaded_netrwPlugin = 1

-- set.background = "dark"  -- already set in `ui.lua`
set.termguicolors = true -- true colors

set.encoding = "utf-8"
-- Set how many lines of history Vim has to remember
set.history = 1000

set.fixendofline = true
set.endofline = true
-------------------------------------------------------------------------------
-------------------- Tabs and spaces
-------------------------------------------------------------------------------

set.expandtab = true -- use spaces instead of tabs
set.shiftwidth = 4 -- shift 4 spaces when tab
set.tabstop = 4 -- 1 tab == 4 spaces
set.autoindent = true -- autoindent new lines
set.smartindent = true --
set.softtabstop = 4 -- let backspace delete indent
-- set.noexpandtab = true -- Tabs are tabs

-- don't remove it
set.hidden = true

-------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------

-- let &colorcolumn="80,100,".join(range(120,999),",")
-- let &colorcolumn="80,100,120"
-- let &colorcolumn="80,120"
cmd([[
    let &colorcolumn=""
    hi! ColorColumn ctermbg=6
]])
set.cursorline = true
set.cursorcolumn = false
-- signcolumn replaced with Oil.win_options
set.signcolumn = "auto" -- only when there is a sign to display.
-- set.signcolumn = "yes"
-- set.signcolumn = 'number'           -- Nvim can merge signcolumn and number column into one

-- Line numbers
set.number = true -- Numberline
set.relativenumber = true -- Relative Numbers

-- Split
set.splitright = true -- Open new split panes to right and
set.splitbelow = true -- bottom, which feels more natural

wset.wrap = false

set.cmdheight = 0
-- Global statusline. Default 2
set.laststatus = 3

set.showmode = false

-- Shorter messages
set.shortmess:append("c")

-- Virtual Edit
-- set.virtualedit = 'all'

set.winbar = "    %{%v:lua.require'nvim-navic'.get_location()%}"

-- Commented out just because Snacks.picker not working properly when
-- using 'edit_split', 'edit_vsplit' keybindings]
-- https://github.com/folke/snacks.nvim/discussions/1783
--
-- Specify the behavior when switching between buffers
-- set.switchbuf = { 'useopen', 'usetab', 'newtab' }

-- Tab
set.showtabline = 2

-- Always use vertical diffs
-- set.diffopt+=vertical
set.diffopt = { "internal", "vertical", "filler", "closeoff" }

set.scrolloff = 10
set.sidescrolloff = 10

-- Folding
-- Disable folding
-- set.nofoldenable

-- Treat underscore as separator
-- set iskeyword-=_

-------------------------------------------------------------------------------
-------------------- Spelling
-------------------------------------------------------------------------------
set.dictionary = "~/.config/nvim/spell/"
set.spell = false
set.spelllang = { "en_us", "cjk", "ru" } -- Dictionary for spellcheck

-------------------------------------------------------------------------------
-------------------- Completion
-------------------------------------------------------------------------------
set.completeopt = "menu,menuone,noselect"
-- set.completeopt = 'noinsert,menu,menuone,noselect'
-- set.completeopt = '.,w,b,u,t,i'

-------------------------------------------------------------------------------
-------------------- Invisible Chars
-------------------------------------------------------------------------------
set.list = true
set.listchars = {
	tab = "▸ ",
	trail = "·",
	eol = "¬",
	extends = "»",
	precedes = "«",
	nbsp = "░",
	space = "·",
}

set.fillchars = {
	vert = "┃",
	fold = "⠀",
	eob = " ", -- suppress ~ at EndOfBuffer
	-- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	diff = "░", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

-- Matchpairs
-- add vertical bar for Ruby
-- set.matchpairs = {
--     '(:)',
--     '{:}',
--     '[:]',
--     '<:>'
-- }

-- Ignore files vim doesnt use
set.wildignore = {
	"*.o",
	"*.a",
	"__pycache__",
	".git",
	".hg",
	".svn",
	"node_modules",
	"*.aux",
	"*.out",
	"*.toc",
	"*.obj",
	"*.exe",
	"*.dll",
	"*.manifest",
	"*.rbc",
	"*.class",
	"*.ai",
	"*.bmp",
	"*.gif",
	"*.ico",
	"*.jpg",
	"*.jpeg",
	"*.png",
	"*.psd",
	"*.webp",
	"*.avi",
	"*.divx",
	"*.mp4",
	"*.webm",
	"*.mov",
	"*.m2ts",
	"*.mkv",
	"*.vob",
	"*.mpg",
	"*.mpeg",
	"*.mp3",
	"*.oga",
	"*.ogg",
	"*.wav",
	"*.flac",
	"*.eot",
	"*.otf",
	"*.ttf",
	"*.woff",
	"*.doc",
	"*.pdf",
	"*.cbr",
	"*.cbz",
	"*.zip",
	"*.tar.gz",
	"*.tar.bz2",
	"*.tar.xz",
	"*.rar",
	"*.kgb",
	"*.swp",
	".lock",
	".DS_Store",
	"._*",
}

-- Search, Find
set.smartcase = true -- Use smartcase everywhere
set.ignorecase = true -- Case insensitive search
set.incsearch = true

set.inccommand = "split"

set.path = { ".", "/usr/include", "**" }

set.cindent = true -- Copy indent from previous line

set.updatetime = 4000
set.timeoutlen = 200 -- wait for mapped key sequence in ms
-- set.ttimeoutlen = 5

-- Undo
set.undofile = true
set.undodir = fn.stdpath("data") .. "undo"
set.shell = "/usr/bin/zsh"

-- No fucking swap files
cmd([[
    set nobackup
    set noswapfile
]])

--------------------- Mouse
set.mouse = ""
set.mousefocus = true

-- use /g for reverse
set.gdefault = true

--------------------- Clipboard
set.clipboard = "unnamed,unnamedplus"

-- cmd([[
--     filetype indent plugin on
--     syntax enable
-- ]])

-- Mise
-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- noexpandtab
-- copyindent
-- preserveindent
-- softtabstop=0
-- shiftwidth=4
-- tabstop=4
cmd([[ autocmd FileType c,cpp,java setlocal noet ci pi sts=0 sw=4 ts=4 ]])

-- set lsp_markdown filetype for '*.md' files
-- cmd[[ autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown setlocal ft=lsp_markdown ]]

-- don't auto comment new lines
-- cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
-- cmd [[autocmd FileType text,markdown,html,xhtml,css setlocal cc=0]]

-- 2 spaces for selected filetypes
-- cmd [[ autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=4 tabstop=4 ]]

-- Jinja2
-- cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]

-- Call `Autoformat` python files on save
-- cmd[[autocmd BufWritePost,FileWritePost *.py Autoformat]]

cmd([[let g:v_warnings = 1]])

-- Remember last edit position
cmd([[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

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

vim.api.nvim_create_user_command("CurrBufOnly", function()
	vim.cmd("%bd|e#|bd#")
end, {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		-- Add django to the filetype if it's not already there
		vim.bo.filetype = "python.django"
	end,
})

-- disable autotag on snacks buffer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_picker_input",
	callback = function()
		vim.b.ts_autotag_enabled = false
	end,
})

-- disable llama on snacks buffer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_picker_input",
	callback = function()
		-- Disable llama.vim for this specific buffer
		vim.b.llama_config = { enabled = false }
		-- If the above doesn't work, try the global disable command for the buffer
		if vim.fn.exists(":LlamaDisable") == 2 then
			vim.cmd("LlamaDisable")
		end
	end,
})

-- llama stops after switching to another buffer
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*",
	callback = function()
		vim.fn["llama#init"]()
	end,
})




-- Oil get current dir
-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	local dir = require("oil").get_current_dir(bufnr)
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end


-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	callback = function()
-- 		vim.opt_local.scrolloff = 999
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	callback = function()
-- 		vim.opt_local.scrolloff = 10
-- 	end,
-- })

-- 	cpp = "g++ %:p -g -o %:p:r_temp && %:p:r_temp",
-- 	c = "gcc %:p -g -o %:p:r_temp && %:p:r_temp",
-- }
--
-- for filetype, command_to_execute in pairs(runners) do
-- 	vim.api.nvim_create_autocmd("FileType", {
-- 		pattern = filetype,
-- 		callback = function()
-- 			local run_cmd = ":" .. (command_to_execute ~= "" and "!" .. command_to_execute or "!") .. " %:p"
--
-- 			-- ,rr -> Save and Run
-- 			vim.keymap.set("n", ",rr", ":w<CR>" .. run_cmd .. "<CR>", { buffer = true, silent = true })
--
-- 			-- ,rc -> Save and Prepare command (no Enter)
-- 			vim.keymap.set("n", ",rc", ":w<CR>" .. run_cmd, { buffer = true })
-- 		end,
-- 	})
-- end
