local set = vim.opt -- global/buffer/windows-scoped options
local cmd = vim.cmd -- execute Vim commands
local fn = vim.fn --
local wset = vim.wo -- Window-scoped
local g = vim.g -- Global
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

-- set border
set.winborder = "single"

-- Tagbar
g.tagbar_compact = 1
g.tagbar_sort = 0

-- Python
g.python3_host_prog = "/home/baka/venvs/neovim/bin/python"
g.python_indent = {
	disable_parentheses_indenting = 1,
	closed_paren_align_last_line = 0,
}

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

set.expandtab = true -- use spaces instead of tabs
set.shiftwidth = 4 -- shift 4 spaces when tab
set.tabstop = 4 -- 1 tab == 4 spaces
set.autoindent = false -- autoindent new lines
-- set.smartindent = true --
set.softtabstop = 4 -- let backspace delete indent
-- set.noexpandtab = true -- Tabs are tabs

-- don't remove it
set.hidden = true

-------------------------------------------------------------------------------
-- UI

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

set.winbar = "   %f | %{%v:lua.require'nvim-navic'.get_location()%}"

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
-- Fold method is set on lua/configs/tree-sitter
-- set.foldmethod = "syntax"
-- set.nofoldenable
set.foldlevel = 99
set.foldlevelstart = 99
set.foldenable = true
-- set.foldtext = ""
-- set.foldcolumn = "auto"

-- vim.opt.fillchars:append({
-- 	foldopen = "▼",
-- 	foldclose = "▶",
-- 	foldsep = " ",
-- })

-- Treat underscore as separator
-- set iskeyword-=_

-------------------------------------------------------------------------------
-------------------- Spelling
set.dictionary = "~/.config/nvim/spell/"
set.spell = false
set.spelllang = { "en_us", "cjk", "ru" } -- Dictionary for spellcheck

-------------------------------------------------------------------------------
-------------------- Completion
set.completeopt = { "menu", "menuone", "noselect", "popup" }
-- set.completeopt = 'noinsert,menu,menuone,noselect'
-- set.completeopt = '.,w,b,u,t,i'

-------------------------------------------------------------------------------
-------------------- Invisible Chars
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

set.fillchars:append({
	vert = "┃",
	eob = " ", -- suppress ~ at EndOfBuffer
	-- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	diff = "░", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",

	-- fold = " ",
	-- foldopen = "",
	-- foldclose = "",
	-- foldsep = "│",
})

-- Matchpairs
set.matchpairs = {
	"(:)",
	"{:}",
	"[:]",
	"<:>",
}

-- Search, Find
set.smartcase = true -- Use smartcase everywhere
set.ignorecase = true -- Case insensitive search
set.incsearch = true

set.inccommand = "split"

set.path = { ".", "/usr/include", "**" }

set.cindent = true -- Copy indent from previous line

set.updatetime = 100
set.timeoutlen = 200 -- wait for mapped key sequence in ms
set.ttimeoutlen = 10
set.redrawtime = 1500

set.showmode = false

-- Undo
set.undofile = true
set.undodir = fn.stdpath("data") .. "/undo"
set.shell = "/usr/bin/zsh"

-- No fucking swap files
cmd([[
    set nobackup
    set noswapfile
]])

--------------------- Mouse
set.mouse = ""
set.mousefocus = true

-- /g by default; use /g for reverse
set.gdefault = true

--------------------- Clipboard
set.clipboard = "unnamed,unnamedplus"

-- Mise
-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

cmd([[let g:v_warnings = 1]])

-- Remember last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Jump to last edit position on opening a file",
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"')
		end
	end,
})

-- highlight Yanks
local yank_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

-- i was here here ?
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 400,
		})
	end,
})

vim.api.nvim_create_user_command("CurrBufOnly", function()
	vim.cmd("%bd|e#|bd#")
end, {})

-- disable autotag on snacks buffer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_picker_input",
	callback = function()
		vim.b.ts_autotag_enabled = false
	end,
})

-- llama.vim
-- related to typing artifacts on some picker's fields
local llama_group = vim.api.nvim_create_augroup("LlamaAutoInit", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	group = llama_group,
	callback = function()
		local ft = vim.bo.filetype
		-- List all filetypes where llama should NOT run
		local ignore_fts = { "snacks_picker_input", "snacks_picker", "TelescopePrompt", "NvimTree", "neo-tree" }

		if not vim.tbl_contains(ignore_fts, ft) then
			-- Only initialize if it's a valid code/text buffer
			pcall(vim.fn["llama#init"])
		else
			vim.b.llama_config = { enabled = false }
			if vim.fn.exists(":LlamaDisable") == 2 then
				vim.cmd("LlamaDisable")
			end
		end
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

-- Django related [there are better ways of locating django project, but this one is simplest]
vim.filetype.add({
	pattern = {
		[".*/templates/.*%.html"] = "htmldjango",
	},
})

local runners = {
	ruby = "ruby",
	javascript = "node",
	crystal = "crystal",
	python = "python",
	-- sh = "", -- shell scripts just need execution
	sh = "sh",
	cpp = "g++ %:p -g -o %:p:r_temp && %:p:r_temp",
	c = "gcc %:p -g -o %:p:r_temp && %:p:r_temp",
}

for filetype, command_to_execute in pairs(runners) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = function()
			local run_cmd = ":" .. (command_to_execute ~= "" and "!" .. command_to_execute or "!") .. " %:p "

			-- ,rr -> run it
			vim.keymap.set("n", "<leader>rr", ":w<CR>" .. run_cmd .. "<CR>", { buffer = true, silent = true })

			-- ,rc -> prepare to run with arguments
			vim.keymap.set("n", "<leader>rc", ":w<CR>" .. run_cmd, { buffer = true })
		end,
	})
end

-- Set colorcolumn at 50,72 for the sake of 50,72 git commit rule
-- Create an augroup to prevent duplicate autocmds when reloading config
--
-- <type>(<scope>): <subject>          <- line 1: max 50 chars
-- <BLANK LINE>
-- <body>                              <- line 3+: wrap at 72 chars
-- <BLANK LINE>
-- <footer>                            <- references, breaking changes

local git_commit_group = vim.api.nvim_create_augroup("GitCommitSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	group = git_commit_group,
	callback = function()
		-- local columns: 50 for (summary) and 72 for (body) as recommended
		vim.opt_local.colorcolumn = "50,72"
		-- auto-wrap
		vim.opt_local.textwidth = 72
	end,
})

-- without this Lazy.nvim will fail
vim.env.GIT_DEFAULT_REF_FORMAT = 'files'

