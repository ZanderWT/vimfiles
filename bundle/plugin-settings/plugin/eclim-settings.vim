"""""""""""""""""""""""""""""""""""""""""""""""
"      Plugin Configurations for eclim        "
"""""""""""""""""""""""""""""""""""""""""""""""
let g:taglisttoo_disabled = 1
let g:EclimTaglistEnabled = 0
let g:EclimValidateSortResults='severity' "sort validation problems by severity
let g:EclimJavaImportPackageSeparationLevel=0 "don't add newlines between import statements
"let g:EclimJavascriptValidate=0 "don't validate javascript files
"let g:EclimJavascriptLintEnabled=0 "don't validate javascript files, seriously
"let g:EclimSignLevel=2 "suppress warnings
"let g:EclimXmlValidate=0 "don't validate xml files

"mappings:
"all the mappings start with <leader>j

nnoremap <silent> <leader>jc :JavaCorrect<CR>
nnoremap <silent> <leader>jd :JavaDocSearch<CR>
nnoremap <silent> <leader>jic :JavaImportClean<CR>
nnoremap <silent> <leader>jim :JavaImportOrganize<CR>
nnoremap <silent> <leader>jis :JavaImportSort<CR>
nnoremap <silent> <leader>jmi :JavaImpl<CR>
nnoremap <leader>jr :JavaRename 
nnoremap <silent> <leader>jS :JavaSearch<CR>
nnoremap <silent> <leader>js :JavaSearchContext<CR>
nnoremap <silent> <leader>jf :%JavaFormat<CR>
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


