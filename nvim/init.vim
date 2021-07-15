filetype off                           " required
call plug#begin('~/.nvim/plugged')

" Git
Plug 'tpope/vim-fugitive'           " A Git wrapper
Plug 'airblade/vim-gitgutter'       " A Vim plugin which shows a git diff in the gutter
" Try to replace it with `gitsigns.nvim`
" Plug 'lewis6991/gitsigns.nvim'
" Plug 'nvim-lua/plenary.nvim'

" Writing
" fcitx toggle layout to en in command mode and back to
Plug 'lilydjwg/fcitx.vim'

" Debugger
" Plug 'hagsteel/vim-vebugger'

" FrontEnd:
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'AndrewRadev/tagalong.vim'
Plug 'turbio/bracey.vim'


" User Interface
Plug 'morhetz/gruvbox'
Plug 'dikiaap/minimalist'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'
" Plug 'ryanoasis/vim-devicons'
" Plug 'wfxr/minimap.vim'


" Julia
Plug 'JuliaEditorSupport/julia-vim', { 'for': 'julia' }


" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-bundler'
" Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'https://github.com/whatyouhide/vim-textobj-erb'
Plug 'stjernstrom/vim-ruby-run'
Plug 'hallison/vim-ruby-sinatra', { 'for': 'ruby' }


" Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format'

" Crystal
Plug 'vim-crystal/vim-crystal', { 'for': 'cr' }


" Python
Plug 'davidhalter/jedi-vim', { 'for': 'py' }
" Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'py' }


" Syntax
Plug 'pangloss/vim-javascript'
Plug 'valloric/MatchTagAlways'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hdima/python-syntax'
Plug 'tpope/vim-ragtag' " A set of mappings for HTML, XML, eRuby, JSP, and more
" Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'mboughaba/i3config.vim'
Plug 'https://github.com/s3rvac/vim-syntax-retdecdsm'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rs' }

Plug 'wellle/targets.vim'


" Functionality for Vim
Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar'               " Vim plugin that displays tags in window, ordered by scope
Plug 'liuchengxu/vista.vim'
Plug 'KabbAmine/zeavim.vim'               " Zeal integration

Plug 'tpope/vim-abolish'                " Subvert
Plug 'tpope/vim-surround'
Plug 'troydm/easytree.vim'
" Plug 'troydm/easybuffer.vim'           " :EasyBuffer
Plug 'godlygeek/tabular'               " Vim script for text filtering and alignment
Plug 'bagrat/vim-buffet'               " Vim Buffet
Plug 'easymotion/vim-easymotion'       " EasyMotion
Plug 'tpope/vim-repeat'                " Vim Repeat
" Plug 'tpope/vim-unimpaired'            " Pairs of handy bracket mappings
Plug 'tpope/vim-commentary'
Plug 'isa/vim-matchit'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
" Plug 'itchyny/vim-cursorword'            " Underlines the word under the cursor
Plug 'terryma/vim-multiple-cursors'    " True Sublime Text style multiple cursors
" Plug 'rhysd/vim-textobj-anyblock'
Plug 'kana/vim-textobj-user'
Plug 'sbdchd/neoformat'
Plug 'Yggdroot/indentLine'
Plug 'nicwest/vim-camelsnek'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'markonm/traces.vim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }


" Linting
Plug 'dense-analysis/ale'

call plug#end()
filetype plugin indent on 	" required

" Built_in_packages:
"
packadd termdebug

" Source config files
let g:nvim_config_root = expand('<sfile>:p:h')
let g:config_files = [
      \ 'general',
      \ 'function',
      \ 'abbr',
      \ 'ui',
      \ 'maps',
      \ 'coc',
      \ 'ruby_settings',
      \ 'plugin_settings',
      \ 'emmet',
      \ 'js',
      \ 'multicursor'
      \ ]

for s:filename in g:config_files
  execute 'source ' . g:nvim_config_root . '/custom_configs/' . s:filename . '.vim'
endfor

" Minimap
" nmap <silent> <leader>m :MinimapToggle<CR>
" let g:minimap_width=15

" hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
" let g:minimap_highlight = 'MinimapCurrentLine'
" let g:minimap_auto_start = 0

set completeopt=menuone,noinsert,noselect
let g:completion_matching_straetgy_list = ['exact', 'substring', 'fuzzy']
