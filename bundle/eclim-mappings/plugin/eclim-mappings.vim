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
"These use the quickfix list if it exists, otherwise the location list
"the mapping requires this function, jumpToError
function! s:JumpToError(direction)
  if empty(getqflist()) 
    if len(getloclist(0)) == 1
      ll
      return
    endif
    if a:direction == 1
      lnext
    else
      lprev
    endif
  else
    if len(getqflist()) == 1
      cc 
      return
    endif
    if a:direction == 1
      cnext
    else
      cprev
    endif
  endif
endfunction
nnoremap <silent> [e :call <SID>JumpToError(0)<CR>
nnoremap <silent> ]e :call <SID>JumpToError(1)<CR>


