let mapleader = ","
let g:mapleadre =","
inoremap <silent><nowait> eu <Esc>

nnoremap ; :
xnoremap ; :
nnoremap & %

" Quicker way to open command window
nnoremap <silent> <leader>ww :update<CR>
nnoremap <silent> <space>qq :x<CR>
nnoremap QQ :q<cr>
nnoremap Qt :q!<cr>
nnoremap Qa :qall<cr>
nnoremap QA :qall!<cr>

nnoremap <space>; q:
nnoremap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap <left> g;
nnoremap <right> g,

nnoremap <silent> <up>      : resize +1<CR>
nnoremap <silent> <down>    : resize -1<CR>
nnoremap <silent> <M-left>  : vertical resize -1<CR>
nnoremap <silent> <M-right> : vertical resize +1<CR>

inoremap <up> <Esc>ddkPi
inoremap <down> <Esc>ddpi

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
nmap <nowait><leader><leader>v <C-W>v:Files<CR>
nmap <nowait><leader><leader>s <C-W>s:Files<CR>

" CALLING FUNCTIONS:
"
" Open files
nnoremap <nowait><M-t> :tabedit 
inoremap <nowait><M-t> <Esc>:tabedit 
nnoremap <nowait><M-e> :edit 
inoremap <nowait><M-e>e <Esc>:edit 

" FZF open files: with preview 
" Use <C-x> for horizontal split and <C-v> for vertical
nmap <nowait> <leader>t :FZF<CR>
" no preview
nmap <S-CR> :Files<CR>
imap <S-CR> <Esc>:Files<CR>

" Buffer
nmap <silent> <nowait><C-CR> :Buffer<cr>

" nmap <space>tt :Tags<cr>
nmap <silent> <nowait><M-f> :Rg<cr>
imap <silent> <nowait><M-f> <Esc>:Rg<cr>
nmap <silent> <nowait><leader>u :UndotreeToggle<cr>
" nmap <silent> <nowait><leader>n :TagbarToggle<CR>
nmap <silent> <nowait><leader>n :Vista!!<CR>
" nmap <silent> <nowait><space>tt :Vista finder<CR>


" Fkeys:
nmap <silent> <F1> :vert help normal-index<cr>
imap <silent> <F1> <Esc>:vert help insert-index<cr>

map <silent> <F2> :update $MYVIMRC <bar> source $MYVIMRC <cr>
map <silent> <F3> :tabnew $MYVIMRC <bar> tcd %:h<cr>

map <silent> <F5> :set list!<cr>
map <silent> <F6> :set cursorline!<CR>

nmap <silent> FF :Filetypes<cr>
nmap <silent> <leader>R :redo<cr>
nmap <nowait> <leader>g :BLines<cr>

map <silent> <space>nn :call NumberToggle()<cr>

" Custom comma motion mapping
" nmap di, f,dT,
" nmap ci, f,cT,

" Delete || change an argument:
" nmap da, f,ld2F,i,<Esc>l
" nmap ca, f,ld2F,i,<Esc>a

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
nnoremap <nowait>dD I<Esc>D
nnoremap <nowait>cC I<Esc>C

" Auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap <nowait>} }zz
nmap <nowait>{ {zz

" Select word under cursor and search 
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


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
vnoremap <ESC> o<ESC>

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
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap  n <Plug>(easymotion-next)
nmap  N <Plug>(easymotion-prev)
" nmap <space>l <Plug>(easymotion-lineforward)
" nmap <space>j <Plug>(easymotion-j)
" nmap <space>k <Plug>(easymotion-k)
" nmap <space>h <Plug>(easymotion-linebackward)

" Tabs:
noremap <Tab> gt

" EasyTree:
map <silent> <C-n> :EasyTreeToggle<CR>
let g:easytree_show_hidden_files=1


" Insert a space before current character
" nnoremap <silent> <space><space> i<TAB><ESC>l

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
nmap <space>Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap <space>Y :w! ~/.vi_tmp<CR>
nmap <space>X :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap <space>X :w! ~/.vi_tmp<CR>gvd
nmap <space>P :r ~/.vi_tmp<CR>

" Join lines and restore cursor location (J)
nnoremap J mjJ`j

nmap <leader><leader><space> :%bd <bar> e# <bar> bd#<cr>

" Terminal section
nnoremap <space><space>t :split term://zsh<CR>
nnoremap <space><space>v :vsplit term://zsh<CR>

" tnoremaps:
" Use Esc or ',,' to quit builtin terminal
" tnoremap <ESC>   <C-\><C-n>
tnoremap <leader><leader>  <C-\><C-n>
" Exit in command modes: FZF, Tags, Rg, Files, Filetypes
tnoremap <silent><nowait><Esc><Esc>  <C-\><C-n>:q!<cr>
" tnoremap <leader>cc <Esc>:q<cr>

" Paste spaces without leaving command mode
nnoremap <silent><space>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent><space>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>


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


" Move this maps to cpp_c_settings.vim file
autocmd FileType c,cpp   imap <buffer> iinc #include <><left>
autocmd FileType c,cpp   imap <buffer> innc #include ""<left>

inoremap <leader><leader>l <C-x><C-l>
