" Fuzzy find
set path+=**
" Lazy file name tab completion
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" Ignore files vim doesnt use
set wildignore+=.git,.hg,.svn,node_modules
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

set inccommand=split

" Tabs and spaces
" Use indents of 2 spaces
set shiftwidth=2
" Tabs are tabs
" set noexpandtab
set expandtab
set tabstop=2
" Let backspace delete indent
set softtabstop=2

" For security reasons
set exrc
set secure
set modelines=0

" Hide buffers, not close them
set hidden

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
set undodir=$HOME/tmp/vim_undo
set undofile
set noswapfile

" Search section
" Case insensitive search
set ignorecase
set smartcase
set infercase
" Searching
set hlsearch
set incsearch

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Disable folding
set nofoldenable

" coffee pasta
" unnamed - copy-on-select, and can be pasted with the
" middle mouse button
" unnamedplus - This is copied with c-c, c-v
" set clipboard^=unnamedplus
set clipboard+=unnamed

set mouse=a

" verticle diffs
set diffopt+=vertical

set completeopt=noinsert,menuone,noselect

" Don't pass messages to |ins-completion-menu|
set shortmess+=c


" ENCODING
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

set autoread

set fileformats=unix,dos,mac


" VISUAL SETTINGS
syntax on
set ruler
set number
" set relativenumber
set laststatus=2
set noshowmode
set showmatch
set showcmd
set so=10

" Switch to an existing buffer if one exists
set switchbuf=useopen

set mousemodel=popup
set guioptions=egmrti
set nocompatible
set mousehide

set updatetime=300

" show invisibles
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=eol:¬
" set listchars+=eol:᚜
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░
set listchars+=space:·
set fillchars=vert:\ 
set list

" Configure backspace so it acts as it should act.
set backspace=eol,start,indent

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in svn, git etc... anyway
set nobackup
set nowb
set noswapfile

" Be smart when using tabs :)
set smarttab

" Copy indent from previous line
set autoindent
set cindent

" Set how many lines of history VIM has to remember
set history=1000

" --- Spelling
" set spell spelllang=en_us
set spelllang=en_us,en_gb,ru,cjk

" Fastening
set re=1


syntax sync minlines=256
set synmaxcol=300

set wrap

set cmdheight=1

" Recently vim || nvim can merge signcolumn and number column into one
" if has("nvim-0.5.0") || has("patch-8.1.1564")
set signcolumn=number
" else
"  set signcolumn=yes
" endif

" Use one space, not two, after punctuation.
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set matchpairs+=<:>

" Always use vertical diffs
set diffopt+=vertical

set dictionary=/usr/share/dict/british-english

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
set stal=1


" Set global default i.e. %s/foo/bar/g
" use g for reverse
set gdefault

set tags=./tags
