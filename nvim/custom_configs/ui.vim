" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
set termguicolors
set t_Co=256
" set background=light


let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="soft"
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1

" let no_buffer_menu=1

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

colorscheme gruvbox

let g:lightline.active = {
      \
      \ 'left': [ 
      \   [ 'mode', 'paste' ],
      \   [ 'filename'],
      \   [ 'tagbar' ] ],
      \
      \ 'right': [
      \   [ 'filetype', 'fileformat'],
      \   [ 'linter_checking', 'linter_errors',
      \     'linter_warnings', 'linter_infos', 'linter_ok' ],
      \   [ 'lineinfo' ], ['charvaluehex', 'percent']]
      \ }

let g:lightline.component = {
      \ 'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \ 'charvaluehex': '0x%B'
      \ }

let g:lightline.component_function = {
      \ 'filename': 'LightLineFilename',
      \ 'cocstatus': 'coc#status',
      \ 'mode': 'LightLineMode',
      \ 'fileformat': 'LightLineFileformat',
      \ 'filetype': 'LightLineFiletype'
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

" functions for LightLine component

function! LightLineModified()
  return &ft =~ 'help' ? '[help]' : &modified ? '[*]' : &modifiable ? '' : '[x]'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '[ro]' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[no name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : '[no ft]') : ''
endfunction

" function! CustomFiletype()
"   return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
" endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" let g:lightline#ale#indicator_checking = "\uf110 "
" let g:lightline#ale#indicator_infos = "\uf129 "
" let g:lightline#ale#indicator_warnings = "\uf071 "
" let g:lightline#ale#indicator_errors = "\uf05e "
" let g:lightline#ale#indicator_ok = "\uf00c "

let g:lightline#ale#indicator_checking = "[ch]"
let g:lightline#ale#indicator_infos = "[i]"
let g:lightline#ale#indicator_warnings = "[*]"
let g:lightline#ale#indicator_errors = "[x]"
let g:lightline#ale#indicator_ok = "[ok]"

" Config for autodetecting i3config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug END

" highlight NonText ctermfg=4
" highlight SpecialKey ctermfg=4

" Highlight ERROR NOTE BUG INFO HACK CHANGED CHANGES WARNING FIXME README TODO IDEA CONCEPT
" Colors located in ~/.nvim/plugged/gruvbox/colors/gruvbox.vim
" Line 576 to Line 579

autocmd Syntax * call matchadd('Todo', '\W\zs\(CONCEPT\|TODO\|FIXME\|CHANGED\|CHANGES\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|README\|unx\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|WARNING\|BUG\)')
