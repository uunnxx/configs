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
set modelines=0

" Hide buffers, not close them
set hidden

" Maintain undo history between sessions
set undofile
set undodir=~/.config/nvim/undo
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
set clipboard^=unnamedplus

set mouse=a

" verticle diffs
set diffopt+=vertical

set completeopt=noinsert,menuone,noselect
set shortmess+=c

" Encoding
set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UTF-8
set ttyfast

set autoread

set fileformats=unix,dos,mac

" Visual Settings
syntax on
set ruler
set number
set laststatus=2
set noshowmode
set showmatch
set showcmd
set so=15

" Switch to an existing buffer if one exists
set switchbuf=useopen

set mousemodel=popup
set guioptions=egmrti
set nocompatible
set mousehide

set updatetime=400

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

" Linebreak on 120 characters
" set lbr
" set breakindent
" set tw=120


" Copy indent from previous line
set autoindent
set cindent

" Set how many lines of history VIM has to remember
set history=1000

" --- Spelling
set spell spelllang=ru,en_us

" Fastening
set re=1

set cursorline
set nocursorcolumn

syntax sync minlines=256
set synmaxcol=300

set wrap

set cmdheight=1
set signcolumn=yes

" Use one space, not two, after punctuation.
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set matchpairs+=<:>

" Always use vertical diffs
set diffopt+=vertical

set dictionary=/usr/share/dict/british-english

" for css
set iskeyword-=-

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
set stal=1


" Set global default i.e. %s/foo/bar/g
" use g for reverse
set gdefault

set tags=./tags;/
