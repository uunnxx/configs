let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark
set t_Co=256
" set background=light


let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_contrast_light="soft"
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1
let g:gruvbox_inverse=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_transparent_bg=1

" let no_buffer_menu=1

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

colorscheme gruvbox

let g:lightline.active = {
      \
      \ 'left': [
      \   ['mode', 'paste', 'method'],
      \   ['cocstatus', 'filename', 'branch_name'],
      \   ['tagbar']],
      \
      \ 'right': [
      \   ['linter_checking','linter_errors','linter_warnings','linter_infos','linter_ok'],
      \   ['lineinfo'], ['filetype', 'charvaluehex', 'percent']]
      \ }

let g:lightline.component = {
      \ 'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \ 'charvaluehex': '0x%B'
      \ }

let g:lightline.component_function = {
      \ 'filename': 'LightLineFilename',
      \ 'branch_name': 'FugitiveStatusLine',
      \ 'cocstatus': 'coc#status',
      \ 'method': 'CocCurrentFunction',
      \ 'mode': 'LightLineMode',
      \ }

let g:lightline.component_expand = {
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_infos': 'lightline#ale#infos',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok',
      \ 'buffers': 'lightline#bufferline#buffers',
      \ 'tabs': 'lightline#tabs'
      \ }

let g:lightline.component_type = {
      \ 'linter_checking': 'right',
      \ 'linter_infos': 'right',
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error',
      \ 'linter_ok': 'right',
      \ 'buffers': 'tabsel'
      \ }

let g:lightline.tabline = {
      \ 'left': [ ['tabs'] ],
      \ 'right': [ ['buffers'] ]
      \ }


function! LightLineFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[ no name ]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! FugitiveStatusLine()
  let branch_name = FugitiveHead()
  return branch_name == '' ? '' : "[ " . branch_name . " ]"
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction


function! LightLineModified()
  return &ft =~ 'help' ? '[ help ]' : &modified ? '*' : &modifiable ? '' : '[ x ]'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '[ ro ]' : ''
endfunction


let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

" Config for autodetecting i3config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/dots/configs/i3/config set filetype=i3config
aug END

hi! link CursorColumn GruvboxRedSign
hi! link MatchParen GruvboxOrangeBold

" highlight NonText ctermfg=4
" highlight SpecialKey ctermfg=4

" Highlight ERROR NOTE BUG INFO HACK CHANGED CHANGES WARNING FIXME README TODO IDEA CONCEPT
" Colors located in ~/.nvim/plugged/gruvbox/colors/gruvbox.vim
" Line 576 to Line 579

autocmd Syntax * call matchadd('Todo', '\W\zs\(CONCEPT\|TODO\|FIXME\|CHANGED\|CHANGES\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|README\|unx\|SYNTAX\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|WARNING\|BUG\)')


" Vista
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction


" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]


" Transparency background
hi Normal guibg=NONE ctermbg=NONE


" Colorcolumn
"
let &colorcolumn=join(range(121,999), ',')
" set colorcolumn=120
hi! ColorColumn ctermbg=6
" hi! ColorColumn guibg=DarkCyan


" Linebreak on 120 characters
" set lbr
" set breakindent
" set tw=120

set cursorline
set nocursorcolumn


" RetDec syntax highlight
autocmd BufNewFile,BufRead *.dsm set filetype=retdecdsm


" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_in = 4

" Coc: Highlight of background seems wrong with floating window.
" hi Quote ctermbg=109 guifg=#83a598


hi! QuickFixLine ctermbg=none
hi! QuickFixLine guibg=none

match Error /\s\+$/
" autocmd Filetype python,ruby,c,cpp match Error /\s\+$/
