let mapleader = ","
let g:mapleadre = ","
inoremap <silent><nowait>eu <esc>

nnoremap ; :
xnoremap ; :
nnoremap & %

" Quicker way to open command window
nnoremap <silent> <leader>ww :update<cr>
nnoremap <silent> <space>qq :x<cr>
nnoremap QQ :q<cr>
nnoremap Qt :q!<cr>
nnoremap Qa :qall<cr>
nnoremap QA :qall!<cr>

nnoremap <space>; q:
nnoremap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap <left>  g;
nnoremap <right> g,

nnoremap <silent> <up>      :resize +1<cr>
nnoremap <silent> <down>    :resize -1<cr>
nnoremap <silent> <M-left>  :vertical resize -1<cr>
nnoremap <silent> <M-right> :vertical resize +1<cr>

inoremap <up> <esc>ddkPi
inoremap <down> <esc>ddpi

" Go to file under cursor
nmap <silent> gf <C-]>
" Back to location you were
nmap <silent> <BS> <C-o>


" Switch between the last two files
nnoremap \| <C-^>

" Simple way to move between windows
nnoremap <nowait>\ <C-W>w
nnoremap <nowait><space><space>w <C-W>x
nnoremap <nowait><space>j <C-W>j
nnoremap <nowait><space>k <C-W>k
nnoremap <nowait><space>h <C-W>h
nnoremap <nowait><space>l <C-W>l

" Move window
nnoremap <nowait><space><space>j <C-W>J
nnoremap <nowait><space><space>k <C-W>K
nnoremap <nowait><space><space>h <C-W>H
nnoremap <nowait><space><space>l <C-W>L

" Split windows
nmap <nowait><leader><leader>v <C-W>v:Files<cr>
nmap <nowait><leader><leader>s <C-W>s:Files<cr>

" CALLING FUNCTIONS:
"
" Open files
nnoremap <nowait><M-t> :tabedit 
inoremap <nowait><M-t> <esc>:tabedit 
nnoremap <nowait><M-e> :edit 
inoremap <nowait><M-e><M-e> <esc>:edit 

" FZF open files: with preview 
" Use <C-x> for horizontal split and <C-v> for vertical
nmap <nowait> <leader>t :FZF<cr>
" no preview
nmap <S-cr> :Files<cr>
imap <S-cr> <esc>:Files<cr>

" Tags
nnoremap <nowait> <space>tg :Tags<cr>
inoremap <nowait> <space>tg <esc>:Tags<cr>

" Buffer
nmap <silent> <nowait><C-cr> :Buffer<cr>

" nmap <space>tt :Tags<cr>
nmap <silent> <nowait><M-f> :Rg<cr>
imap <silent> <nowait><M-f> <esc>:Rg<cr>
nmap <silent> <nowait><leader>u :UndotreeToggle<cr>
" nmap <silent> <nowait><leader>n :TagbarToggle<cr>
nmap <silent> <nowait><leader>n :Vista!!<cr>
" nmap <silent> <nowait><space>tt :Vista finder<cr>


" Fkeys:
nmap <silent> <F1> :vert help normal-index<cr>
imap <silent> <F1> <esc>:vert help insert-index<cr>

map <silent> <F2> :update $MYVIMRC <bar> source $MYVIMRC <cr>
map <silent> <F3> :tabnew $MYVIMRC <bar> tcd %:h<cr>

map <silent> <F5> :set list!<cr>
map <silent> <F6> :set cursorline!<cr>

nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>


nmap <silent> FF :Filetypes<cr>
nmap <silent> <leader>R :redo<cr>
nmap <nowait> <leader>g :BLines<cr>

map <silent> <space>nn :call NumberToggle()<cr>

" Custom comma motion mapping
" nmap di, f,dT,
" nmap ci, f,cT,

" Delete || change an argument:
" nmap da, f,ld2F,i,<esc>l
" nmap ca, f,ld2F,i,<esc>a

" Delete || change surrounding characters
" noremap ds{ F{xf}x
" noremap cs{ F{xf}xi

" noremap ds" F"x,x
" noremap cs" F"x,xi

" noremap ds' F'x,x
" noremap cs' F'x,xi

" noremap ds( F(xf)x
" noremap cs( F(xf)xi

" noremap ds) F(xf)x
" noremap cs) F(xf)xi

" Delete || change word separated by underscores or alternatively
" set iskeyword-=_
nmap du dt_
nmap Du df_
nmap cu ct_
nmap Cu cf_

nnoremap cU bf_ldea
nnoremap dU bf_de


" FOR_EDU:
"   Ruby:
"     test_array = ['text', 'hereb', 'text', 'hereb', 'text', 'hereb', 'text', 'hereb']
"     test_hash = {:foo => 'text', :bar => 2}
"     test_cmd = `command to execute`

" Delete array|hash's first key
nnoremap dcd 0f[ldW
nnoremap dhd 0f{ldf,x
" Delete array|hash's keys but first
nnoremap dcD 0f[f,dt]
nnoremap dhD 0f{f,dt}

" Change array|hash's first key
nnoremap ccd 0f[lcW
nnoremap chd 0f{lct,
" Change array|hash's keys but first
nnoremap ccD 0f[f,lct] 
nnoremap chD 0f{f,lct} 

" def main(arg, arg2)
"   do_something
" end



" Defaults:
"   By VIM core:
"
"     cib => ci(
"     cab => ca(
"     ciB => ci{
"     caB => ca{
"
" Additional:
"   Because of dvp keyboard layout I don't know the exact place of the
"   key [] and it's hard to press `
"
"     cid => ci[
"     cad => ca[
"     ciD => ci`
"     caD => ca`
"
"     did => di[
"     dad => da[
"     diD => di`
"     daD => da`
"
"     vid => vi[
"     vad => va[
"     viD => vi`
"     vaD => va`
"
"     yid => yi[
"     yad => ya[
"     yiD => yi`
"     yaD => ya`

nnoremap cid ci[
nnoremap cad ca[
nnoremap ciD ci`
nnoremap caD ca`

nnoremap did di[
nnoremap dad da[
nnoremap diD di`
nnoremap daD da`

nnoremap vid vi[
nnoremap vad va[
nnoremap viD vi`
nnoremap vaD va`

nnoremap yid yi[
nnoremap yad ya[
nnoremap yiD yi`
nnoremap yaD ya`


" Change text _without putting the text into register,
" see http://tinyurl.com/y2ap4h69
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" Empty || Change current line
nnoremap <nowait>dD I<esc>D
nnoremap <nowait>cC I<esc>C

" Auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap <nowait>} }zz
nmap <nowait>{ {zz

" Select word under cursor and search 
vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>
vnoremap // y/\V<C-R>=escape(@",'/\')<cr><cr>


" Find and replace
nnoremap <nowait> <C-h> :%s/\C\<<C-r><C-w>\>//<left>
xnoremap <nowait> <C-h> :s/
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>

" Treat long lines as break lines (useful when moving around
" in them) unless we had count
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" nnoremap <silent> ^ g^
nnoremap <silent> 0 g0

" Go to start or end of line easier
nnoremap <nowait>H g^
xnoremap <nowait>H g^
nnoremap <nowait>L g_
xnoremap <nowait>L g_

" Highlight last inserted text
nnoremap gV `[v`]

" Go to the starting position after visual modes
vnoremap <esc> o<esc>

" Disable highlight when <leader> <cr> is pressed
" nnoremap <silent> <space><cr> :noh<cr>
" Redraw screen after turning off search highlighting
nnoremap <silent> <C-l> :nohl<cr><C-l>

" In vim, use gp and gP instead of p and P to leave the cursor after the pasted text.
noremap p gp
noremap P gP
noremap gp p
noremap gP P


" EasyMotion:
nmap ss <Plug>(easymotion-overwin-f2)
map   / <Plug>(easymotion-sn)
omap  / <Plug>(easymotion-tn)
nmap  n <Plug>(easymotion-next)
nmap  N <Plug>(easymotion-prev)
" nmap <space>l <Plug>(easymotion-lineforward)
" nmap <space>j <Plug>(easymotion-j)
" nmap <space>k <Plug>(easymotion-k)
" nmap <space>h <Plug>(easymotion-linebackward)

" Tabs:
noremap <Tab> gt

" EasyTree:
map <silent> <C-n> :EasyTreeToggle<cr>
let g:easytree_show_hidden_files=1


" Insert a space before current character
" nnoremap <silent> <space><space> i<TAB><esc>l

" Continuous visual shifting (do not exit Visual mode)
" `gv` means to reselect previous visual area, see https://goo.gl/m1UeiT
" xnoremap < <gv
" xnoremap > >gv


" COPY:
" copy entire file
map <C-c> :%y+<cr>
" copy selected line
vmap yy "+y
" nnoremap Y y$

nnoremap ' `
nnoremap ` '

nnoremap U <C-r>

" Transfer text between two VIM instances
" Copy and paste & cut and paste between different Vim sessions
nnoremap <space>Y :!echo ""> ~/.vi_tmp<cr><cr>:w! ~/.vi_tmp<cr>
vnoremap <silent>map <space>Y :w! ~/.vi_tmp<cr>
nnoremap <space>X :!echo ""> ~/.vi_tmp<cr><cr>:w! ~/.vi_tmp<cr>
vnoremap <space>X :w! ~/.vi_tmp<cr>gvd
nnoremap <space>P :r ~/.vi_tmp<cr>
" vmap <leader>wr :w! expand("%:p:h")/

" Join lines and restore cursor location (J)
nnoremap J mjJ`j

nnoremap <leader><leader><space> :%bd <bar> e# <bar> bd#<cr>

" TERMINAL SECTION:
nnoremap <space><space>t :split term://zsh<cr>
nnoremap <space><space>v :vsplit term://zsh<cr>

" tnoremaps:
" Use esc or ',,' to quit builtin terminal
" tnoremap <esc>   <C-\><C-n>
tnoremap <leader><leader>  <C-\><C-n>
" Exit in command modes: FZF, Tags, Rg, Files, Filetypes
tnoremap <silent><nowait><esc>  <C-\><C-n>:q!<cr>
" tnoremap <leader>cc <esc>:q<cr>


" END_OF_TERMINAL_SECTION

" Paste spaces without leaving command mode
nnoremap <silent><space>o :<C-u>call append(line("."),   repeat([""], v:count1))<cr>
nnoremap <silent><space>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<cr>


" C-a C-x enumerate
nnoremap + <C-a>
nnoremap - <C-x>
vnoremap + g<C-a>gv
vnoremap - g<C-x>gv


" Run code w/o arg  <leader>rr
" Run with argument <leader>rc
autocmd FileType ruby    nmap <buffer> <leader>rr :w\|:!ruby ./%<cr>
autocmd FileType ruby    nmap <buffer> <leader>rc :w\|:!ruby ./%
autocmd FileType crystal nmap <buffer> <leader>rr :w\|:!crystal ./%<cr>
autocmd FileType crystal nmap <buffer> <leader>rc :w\|:!crystal ./%
autocmd FileType python  nmap <buffer> <leader>rr :w\|:!python3 ./%<cr>
autocmd FileType python  nmap <buffer> <leader>rc :w\|:!python3 ./%
autocmd FileType cpp     nmap <buffer> <leader>rr :w\|:!g++ ./% -g -o %:r_temp && ./%:r_temp<cr>
autocmd FileType cpp     nmap <buffer> <leader>rc :w\|:!g++ ./% -g -o %:r_temp && ./%:r_temp
autocmd FileType c       nmap <buffer> <leader>rr :w\|:!gcc ./% -g -o %:r_temp && ./%:r_temp<cr>
autocmd FileType c       nmap <buffer> <leader>rc :w\|:!gcc ./% -g -o %:r_temp && ./%:r_temp

inoremap <leader><leader>l <C-x><C-l>

" coc floating popup menu scroll
nnoremap <nowait><expr> <M-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <M-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <M-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<right>"
inoremap <nowait><expr> <M-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<left>"

" Man pages:
nnoremap <nowait><space>kv :Vman <C-R><C-W><cr>
nnoremap <nowait><space>kk :Man <C-R><C-W><cr>

nnoremap <silent> <PageUp> <C-U>
vnoremap <silent> <PageUp> <C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D>
vnoremap <silent> <PageDown> <C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D>


" Zeal Vim
" default keymaps:
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
" nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset


" Table mode motion
" vim-table-mode
autocmd FileType markdown,md call MarkdownOptions()

function MarkdownOptions()

  nmap Th [\|
  nmap Tl ]\|
  nmap Tj }\|
  nmap Tk {\|

endfunction
