"""""""""""""""""""""""""""""""""""""""""""""""
"      Plugin Configurations for CtrlP        "
"""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_root_markers = ['.vimdir']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': 'Tomcat 6.0\\webapps\\JavaWeb'}
let g:ctrlp_extensions = ['tag']

"<F4> to toggle most recently used documents window
nnoremap <silent> <F4> :CtrlPMRU<CR>

"tab to open ctrlP in buffer mode
nnoremap <silent> <Tab> :CtrlPBuffer<CR>
