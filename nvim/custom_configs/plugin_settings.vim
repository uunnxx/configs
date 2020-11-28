" Tagbar section:
"
let g:tagbar_type_ruby = {
      \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
      \ ]
      \ }

let g:tagbar_type_clojure = {
      \ 'ctagstype': 'clojure',
      \ 'kinds' : [
      \   'n:namespace',
      \   'd:definition',
      \   'f:function',
      \   'm:macro',
      \   'i:inline',
      \   'a:multimethod definition',
      \   'b:multimethod implementation',
      \   'c:defonce',
      \   's:struct',
      \   'v:intern',
      \ ]
      \ }

let g:tagbar_type_puppet = {
      \ 'ctagstype': 'puppet',
      \ 'kinds': [
      \    'c:class',
      \    's:site',
      \    'n:node',
      \    'd:definition'
      \ ]
      \ }

let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \   'h:Heading_L1',
      \   'i:Heading_L2',
      \   'k:Heading_L3'
      \ ]
      \ }

let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \    'T:types,type definitions',
      \    'f:functions,function definitions',
      \    'g:enum,enumeration names',
      \    's:structure names',
      \    'm:modules,module names',
      \    'c:consts,static constants',
      \    't:traits,traits',
      \    'i:impls,trait implementations',
      \ ]
      \ }

" IndentLine section:
"
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Colorcolumn
"
let &colorcolumn=join(range(121,999), ',')

" WebDevIcons section:
"
" let g:webdevicons_enable = 1
" let g:webdevicons_enable_startify = 1


" ALE section:
let g:ale_disable_lsp = 0
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"let g:ale_open_list = 1
"let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=0 ctermfg=magenta

let g:ale_linters = {
  \ 'ruby': ['solograph', 'rubocop', 'standardrb'],
  \ 'python': ['flake8', 'pylint'],
  \ 'javascript': ['eslint'],
  \ 'cpp': ['clang'],
  \ 'c': ['clang']
  \ }

let g:ale_fixers = {
  \ 'ruby': ['standardrb'],
  \ }


" JSON section:
"
let g:vim_json_syntax_conceal = 0



" GitGutter section:
"
let g:gitgutter_highlight_linenrs = 1
" speed optimizations
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_max_signs = 1500
let g:gitgutter_diff_args = '-w'
" custom symbols
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = ':'
" color overrrides
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green ctermbg=0
highlight GitGutterChange ctermfg=yellow ctermbg=0
highlight GitGutterDelete ctermfg=red ctermbg=0
highlight GitGutterChangeDelete ctermfg=red ctermbg=0



" SLIM section
"
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim



" EasyMotion section:
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1



" FZF section:
"
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R'
let g:fzf_tags_command = 'ripper-tags -R --exclude=.git'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)


" Neoformat section:
"
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1



" Jedi
"

" disable autocomplition, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

