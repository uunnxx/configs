local set   = vim.opt             -- global/buffer/windows-scoped options
local cmd   = vim.cmd             -- execute Vim commands
local fn    = vim.fn              -- 
local wset  = vim.wo              -- Window-scoped
local bset  = vim.bo              -- Buffer-scoped





-- Only run these settings once
if not packer_plugins then
  -- vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
  set.background = "dark"
  set.termguicolors = true -- true colors
end

set.encoding = 'utf-8'
-- Set how many lines of history Vim has to remember
set.history = 1000

-------------------------------------------------------------------------------
-------------------- Tabs and spaces
-------------------------------------------------------------------------------

set.expandtab = true      -- use spaces instead of tabs
set.shiftwidth = 2        -- shift 2 spaces when tab
set.tabstop = 2           -- 1 tab == 2 spaces
set.autoindent = true     -- autoindent new lines
set.smartindent = true    --
set.softtabstop = 2       -- let backspace delete indent
-- set.noexpandtab = true -- Tabs are tabs


-------------------------------------------------------------------------------
-------------------- UI
-------------------------------------------------------------------------------

set.colorcolumn = '80'              -- Edit 120
set.cursorline = true
set.cursorcolumn = false
set.signcolumn = 'auto'             -- only when there is a sign to display.
-- set.signcolumn = 'number'           -- Nvim can merge signcolumn and number column into one

-- Line numbers
set.number = true                   -- Numberline
set.relativenumber = true           -- Relative Numbers

-- Split
set.splitright = true               -- Open new split panes to right and
set.splitbelow = true               -- bottom, which feels more natural

wset.wrap = true

set.cmdheight = 2
set.showmode = false

-- Shorter messages
set.shortmess:append('c')

-- Virtual Edit
-- set.virtualedit = 'all'


-- Specify the behavior when switching between buffers
set.switchbuf = 'useopen,usetab,newtab'

-- Tab
set.showtabline = 2

-- Always use vertical diffs
-- set.diffopt+=vertical
set.diffopt = {'internal', 'vertical', 'filler', 'closeoff'}



-- Folding
-- Disable folding
-- set.nofoldenable





-------------------------------------------------------------------------------
-------------------- Spelling
-------------------------------------------------------------------------------
set.dictionary='/usr/share/dict/british-english'
set.spelllang = { 'en_us', 'cjk', 'ru' }    -- Dictionary for spellcheck




-------------------------------------------------------------------------------
-------------------- Completion
-------------------------------------------------------------------------------
set.completeopt = 'noinsert,menu,menuone,noselect'
-- set.completeopt = '.,w,b,u,t,i'







set.so=15

-------------------------------------------------------------------------------
-------------------- Invisible Chars
-------------------------------------------------------------------------------
set.list = true
set.listchars = { 
  tab = '▸ ',
  trail = '·',
  eol = '¬',
  extends = '»',
  precedes = '«',
  nbsp = '░',
  space = '·'
}

set.fillchars = {
  vert = "│",
  fold = "⠀",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}


-- Matchpairs
-- add vertical bar for Ruby
set.matchpairs = {
  '(:)',
  '{:}',
  '[:]',
  '<:>'
}


-- Ignore files vim doesnt use
set.wildignore = {
  '*.o', '*.a', '__pycache__', '.git', '.hg', '.svn', 'node_modules', '*.aux',
  '*.out', '*.toc', '*.o', '*.obj', '*.exe', '*.dll', '*.manifest', '*.rbc',
  '*.class', '*.ai', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.jpeg', '*.png',
  '*.psd', '*.webp', '*.avi', '*.divx', '*.mp4', '*.webm', '*.mov', '*.m2ts',
  '*.mkv', '*.vob', '*.mpg', '*.mpeg', '*.mp3', '*.oga', '*.ogg', '*.wav',
  '*.flac', '*.eot', '*.otf', '*.ttf', '*.woff', '*.doc', '*.pdf', '*.cbr',
  '*.cbz', '*.zip', '*.tar.gz', '*.tar.bz2', '*.tar.xz', '*.rar',
  '*.kgb', '*.swp', '.lock', '.DS_Store', '._*'
}


-- Search, Find

set.ignorecase = true               -- Case insensitive search
set.incsearch = true

set.inccommand = 'split'

set.path = {'.','/usr/include', '**'}


set.cindent = true                  -- Copy indent from previous line

set.updatetime = 100
set.timeoutlen = 500
set.ttimeoutlen = 5



-- Undo

set.undofile = true
set.undodir = fn.stdpath('data') .. 'undo'
set.shell = '/usr/bin/zsh'



--------------------- Mouse
set.mouse = 'a'
set.mousefocus = true

-- use g for reverse
set.gdefault = true



--------------------- Clipboard
set.clipboard = 'unnamedplus'


cmd([[
  filetype indent plugin on
  syntax enable
]])
