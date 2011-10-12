"mappings for the eclim plugin
"all the mappings start with <leader>j

nnoremap <silent> <leader>jc :JavaCorrect<CR>
nnoremap <silent> <leader>jd :JavaDocSearch<CR>
nnoremap <silent> <leader>jic :JavaImportClean<CR>
nnoremap <silent> <leader>jim :JavaImportMissing<CR>
nnoremap <silent> <leader>jis :JavaImportSort<CR>
nnoremap <silent> <leader>jmi :JavaImpl<CR>
nnoremap <leader>jr :JavaRename 
nnoremap <silent> <leader>jS :JavaSearch<CR>
nnoremap <silent> <leader>js :JavaSearchContext<CR>
"]e and [e to jump to next and previous error
nnoremap <silent> [e :lprev<CR>
nnoremap <silent> ]e :lnext<CR>


