local set   = vim.opt             -- global/buffer/windows-scoped options
local cmd   = vim.cmd             -- execute Vim commands
local fn    = vim.fn              --
local wset  = vim.wo              -- Window-scoped
local g     = vim.g               -- Global
-- local bset  = vim.bo              -- Buffer-scoped




-- disable netrw [disabling it will block some plugins, like open in Browser]
-- g.loaded_netrw =  1
-- g.loaded_netrwPlugin = 1

set.background = "dark"
set.termguicolors = true -- true colors

set.encoding = 'utf-8'
-- Set how many lines of history Vim has to remember
set.history = 1000

-------------------------------------------------------------------------------
-------------------- Tabs and spaces
-------------------------------------------------------------------------------

set.expandtab = true      -- use spaces instead of tabs
set.shiftwidth = 4        -- shift 4 spaces when tab
set.tabstop = 4           -- 1 tab == 4 spaces
set.autoindent = true     -- autoindent new lines
set.smartindent = true    --
set.softtabstop = 4       -- let backspace delete indent
-- set.noexpandtab = true -- Tabs are tabs


-- don't remove it
set.hidden = true

-------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------

-- let &colorcolumn="80,100,".join(range(120,999),",")
cmd[[
    let &colorcolumn="80,100,120"
    hi! ColorColumn ctermbg=6
]]
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

wset.wrap = false

set.cmdheight = 1
-- Global statusline. Default 2
set.laststatus = 3

set.showmode = false

-- Shorter messages
set.shortmess:append('c')

-- Virtual Edit
-- set.virtualedit = 'all'

set.winbar = "    %{%v:lua.require'nvim-navic'.get_location()%}"


-- Specify the behavior when switching between buffers
set.switchbuf = 'useopen,usetab,newtab'

-- Tab
set.showtabline = 2

-- Always use vertical diffs
-- set.diffopt+=vertical
set.diffopt = {'internal', 'vertical', 'filler', 'closeoff'}

set.scrolloff=5


-- Folding
-- Disable folding
-- set.nofoldenable


-- Treat underscore as separator
-- set iskeyword-=_



-------------------------------------------------------------------------------
-------------------- Spelling
-------------------------------------------------------------------------------
set.dictionary='~/.config/nvim/spell/'
set.spell = false
set.spelllang = { 'en_us', 'cjk', 'ru' }    -- Dictionary for spellcheck



-------------------------------------------------------------------------------
-------------------- Completion
-------------------------------------------------------------------------------
set.completeopt = 'menu,menuone,noselect'
-- set.completeopt = 'noinsert,menu,menuone,noselect'
-- set.completeopt = '.,w,b,u,t,i'



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
set.matchpairs = {
    '(:)',
    '{:}',
    '[:]',
    '<:>'
}


-- Ignore files vim doesnt use
set.wildignore = {
    '*.o', '*.a', '__pycache__', '.git', '.hg', '.svn', 'node_modules', '*.aux',
    '*.out', '*.toc', '*.obj', '*.exe', '*.dll', '*.manifest', '*.rbc',
    '*.class', '*.ai', '*.bmp', '*.gif', '*.ico', '*.jpg', '*.jpeg', '*.png',
    '*.psd', '*.webp', '*.avi', '*.divx', '*.mp4', '*.webm', '*.mov', '*.m2ts',
    '*.mkv', '*.vob', '*.mpg', '*.mpeg', '*.mp3', '*.oga', '*.ogg', '*.wav',
    '*.flac', '*.eot', '*.otf', '*.ttf', '*.woff', '*.doc', '*.pdf', '*.cbr',
    '*.cbz', '*.zip', '*.tar.gz', '*.tar.bz2', '*.tar.xz', '*.rar',
    '*.kgb', '*.swp', '.lock', '.DS_Store', '._*'
}


-- Search, Find
set.smartcase = true               -- Use smartcase everywhere
set.ignorecase = true               -- Case insensitive search
set.incsearch = true

set.inccommand = 'split'

set.path = {'.','/usr/include', '**'}


set.cindent = true                  -- Copy indent from previous line

set.updatetime = 200
set.timeoutlen = 500
set.ttimeoutlen = 5



-- Undo
set.undofile = true
set.undodir = fn.stdpath('data') .. 'undo'
set.shell = '/usr/bin/zsh'

-- No fucking swap files
cmd[[
set nobackup
set noswapfile
]]



--------------------- Mouse
set.mouse = ''
set.mousefocus = true

-- use g for reverse
-- set.gdefault = true



--------------------- Clipboard
set.clipboard = 'unnamedplus'


cmd([[
    filetype indent plugin on
    syntax enable
]])
