" Settings

" open the tagbar window on the left
let g:tagbar_left = 1
" always show the current tag, even if it is nested in folds
let g:tagbar_autoshowtag = 1
" focus the tagbar when it opens and close it when a tag is selected
let g:tagbar_autoclose = 1

" Mappings
nnoremap <F2> :TagbarToggle<CR>
