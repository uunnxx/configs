" Tagbar section:

if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds': [
      \   'm:modules',
      \   'c:classes',
      \   'C:constants',
      \   'F:singleton methods',
      \   'f:methods',
      \   'a:aliases'
      \ ],
      \ 'kind2scope' : { 'c' : 'class', 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif

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

let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
      \   'p:protocols',
      \   'm:modules',
      \   'e:exceptions',
      \   'y:types',
      \   'd:delegates',
      \   'f:functions',
      \   'c:callbacks',
      \   'a:macros',
      \   't:tests',
      \   'i:implementations',
      \   'o:operators',
      \   'r:records'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \   'p' : 'protocol',
      \   'm' : 'module'
      \ },
      \ 'scope2kind' : {
      \   'protocol' : 'p',
      \   'module' : 'm'
      \ },
      \ 'sort' : 0
      \ }

let g:tagbar_type_css = {
      \ 'ctagstype' : 'Css',
      \ 'kinds'     : [
      \   'c:classes',
      \   's:selectors',
      \   'i:identities'
      \ ]
      \ }

let g:tagbar_type_crystal = {
      \ 'ctagstype': 'crystal',
      \ 'kinds' : [
      \   'd:defs',
      \   'f:functions',
      \   'c:classes',
      \   'm:modules',
      \   'l:libs',
      \   's:structs'
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
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_linters_explicit = 1
"let g:ale_open_list = 1
"let g:ale_lint_on_text_changed = 'never'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

highlight ALEErrorSign ctermbg=0 ctermfg=red
highlight ALEWarningSign ctermbg=0 ctermfg=yellow


let g:ale_linters = {}
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.elixir = ['elixir-ls', 'credo']
let g:ale_linters.ruby = ['rubocop', 'ruby', 'solargraph']

" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

let g:ale_fixers = {'ruby': ['trim_whitespace']}
let g:ale_fixers = {'ruby': ['remove_trailing_lines']}
let g:ale_fixers = {'javascript': ['trim_whitespace']}
let g:ale_fixers = {'javascript': ['remove_trailing_lines']}
let g:ale_fixers = {'elixir': ['trim_whitespace']}
let g:ale_fixers = {'elixir': ['remove_trailing_lines']}

let g:ale_fixers.javascript = ['eslint', 'prettier']
let g:ale_fixers.html = ['prettier']
let g:ale_fixers.scss = ['stylelint']
let g:ale_fixers.css = ['stylelint']
let g:ale_fixers.elm = ['format']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fixers.xml = ['xmllint']

" let g:ale_sign_column_always = 1
let g:ale_elixir_credo_strict = 1


let g:ale_elixir_elixir_ls_release = expand("~/apps/elixirLS")
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}


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

" Elixir
autocmd FileType elixir setlocal formatprg=mix\ format\ -


" Tagalong
let g:tagalong_verbose = 1

" Bracey
let g:bracey_refresh_on_save = 1


" AutoPairs section:

autocmd FileType cpp let g:AutoPairs = AutoPairsDefine({ '<' : '>' })


autocmd FileType c,cpp           setlocal path+=/usr/include include&
autocmd FileType sh,zsh,csh,tcsh setlocal include=^\\s*\\%(\\.\\\|source\\)\\s

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
