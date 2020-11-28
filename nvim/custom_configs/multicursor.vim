let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-b>'
let g:multi_cursor_select_all_word_key = '<M-d>'
let g:multi_cursor_start_key           = 'g<C-b>'
let g:multi_cursor_select_all_key      = 'g<M-d>'
let g:multi_cursor_next_key            = '<C-b>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
