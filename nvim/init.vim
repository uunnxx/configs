filetype off                           " required
call plug#begin('~/.nvim/plugged')

" Git
Plug 'tpope/vim-fugitive'           " A Git wrapper
Plug 'airblade/vim-gitgutter'       " A Vim plugin which shows a git diff in the gutter

" Writing
" fcitx toggle layout to en in command mode and back to
" Plug 'lilydjwg/fcitx.vim'

" Debugger:
" Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'


" Snippet:
Plug 'https://github.com/honza/vim-snippets'


" FrontEnd:
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'AndrewRadev/tagalong.vim'
Plug 'turbio/bracey.vim'


" User Interface
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'https://github.com/dhruvasagar/vim-table-mode', { 'for': ['md', 'markdown']}

" Julia
Plug 'JuliaEditorSupport/julia-vim', { 'for': ['julia', 'jl'] }


" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rb'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rb'] }
Plug 'tpope/vim-rake', { 'for': ['ruby', 'rb', 'rakefile', 'rake'] }
Plug 'tpope/vim-bundler',  { 'for': ['ruby', 'rb'] }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'https://github.com/whatyouhide/vim-textobj-erb', { 'for': ['ruby', 'rb', 'erb'] }
Plug 'stjernstrom/vim-ruby-run', { 'for': ['ruby', 'rb'] }
Plug 'hallison/vim-ruby-sinatra', { 'for': ['ruby', 'rb'] }


" Elixir
Plug 'elixir-editors/vim-elixir', { 'for': ['ex', 'exs', 'elixir'] }
Plug 'slashmili/alchemist.vim', { 'for': ['ex', 'exs', 'elixir']}
Plug 'mhinz/vim-mix-format', { 'for': ['ex', 'exs', 'elixir'] }

" Crystal
Plug 'vim-crystal/vim-crystal', { 'for': 'cr' }


" Python
Plug 'davidhalter/jedi-vim', { 'for': 'py' }
Plug 'hdima/python-syntax', { 'for': 'py' }

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'valloric/MatchTagAlways'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-ragtag' " A set of mappings for HTML, XML, eRuby, JSP, and more
Plug 'mboughaba/i3config.vim'
Plug 'https://github.com/s3rvac/vim-syntax-retdecdsm'
Plug 'https://github.com/vim-utils/vim-man'

" Auto tags generate
Plug 'ludovicchabant/vim-gutentags'


" Haskell
Plug 'https://github.com/neovimhaskell/haskell-vim.git', { 'for': 'hs' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rs', 'rlib']}


Plug 'wellle/targets.vim'


" Functionality for Vim
Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar'               " Vim plugin that displays tags in window, ordered by scope
Plug 'liuchengxu/vista.vim'
Plug 'KabbAmine/zeavim.vim'               " Zeal integration

Plug 'tpope/vim-abolish'                " Subvert
Plug 'tpope/vim-surround'
Plug 'troydm/easytree.vim'
Plug 'godlygeek/tabular'               " Vim script for text filtering and alignment
Plug 'bagrat/vim-buffet'               " Vim Buffet
Plug 'easymotion/vim-easymotion'       " EasyMotion
Plug 'tpope/vim-repeat'                " Vim Repeat
" Plug 'tpope/vim-unimpaired'            " Pairs of handy bracket mappings
Plug 'tpope/vim-commentary'
Plug 'isa/vim-matchit'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
" Plug 'itchyny/vim-cursorword'            " Underlines the word under the cursor
Plug 'terryma/vim-multiple-cursors'    " True Sublime Text style multiple cursors
" Plug 'rhysd/vim-textobj-anyblock'
Plug 'kana/vim-textobj-user'
Plug 'sbdchd/neoformat' " -- DEBUG
Plug 'Yggdroot/indentLine' " -- DEBUG
Plug 'nicwest/vim-camelsnek'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'markonm/traces.vim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

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
      \ 'multicursor',
      \ 'ui_elixir',
      \ 'ui_ruby',
      \ 'python',
      \ 'cpp_c_settings'
      \ ]

for s:filename in g:config_files
  execute 'source ' . g:nvim_config_root . '/custom_configs/' . s:filename . '.vim'
endfor

set completeopt=menuone,noinsert,noselect
let g:completion_matching_straetgy_list = ['exact', 'substring', 'fuzzy']

let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0
