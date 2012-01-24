"""""""""""""""""""""""""""""""""""""""""""""""
"    Plugin Configurations for VCSCommand     "
"""""""""""""""""""""""""""""""""""""""""""""""

let g:VCSCommandEnableBufferSetup=1
autocmd Filetype java,javascript,jsp call <SID>doVCSCommandMappings()

function! s:doVCSCommandMappings()
  nnoremap <buffer> <Leader>ce  :CVSEdit<CR>
  nnoremap <buffer> <Leader>cE  :CVSEditors<CR>
  nnoremap <buffer> <Leader>ct  :CVSUnedit<CR>
  nnoremap <buffer> <Leader>cwv :CVSWatchers<CR>
  nnoremap <buffer> <Leader>cwa :CVSWatchAdd<CR>
  nnoremap <buffer> <Leader>cwn :CVSWatchOn<CR>
  nnoremap <buffer> <Leader>cwf :CVSWatchOff<CR>
  nnoremap <buffer> <Leader>cwf :CVSWatchRemove<CR>
endfunction
