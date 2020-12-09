let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key = ','
let g:user_emmet_mode='a'

imap ,,   <plug>(emmet-expand-abbr)
imap ,;   <plug>(emmet-expand-word)
imap ,u   <plug>(emmet-update-tag)
imap ,d   <plug>(emmet-balance-tag-inward)
imap ,D   <plug>(emmet-balance-tag-outward)
imap ,n   <plug>(emmet-move-next)
imap ,N   <plug>(emmet-move-prev)
imap ,i   <plug>(emmet-image-size)
imap ,/   <plug>(emmet-toggle-comment)
imap ,j   <plug>(emmet-split-join-tag)
imap ,k   <plug>(emmet-remove-tag)
imap ,a   <plug>(emmet-anchorize-url)
imap ,A   <plug>(emmet-anchorize-summary)
imap ,m   <plug>(emmet-merge-lines)
imap ,c   <plug>(emmet-code-pretty)
