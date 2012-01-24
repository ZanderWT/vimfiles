"""""""""""""""""""""""""""""""""""""""""""""""
"     Plugin Configurations for Taglist       "
"""""""""""""""""""""""""""""""""""""""""""""""

let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Process_File_Always = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Close_On_Select = 1
let g:tlist_vb_settings = 'vb;s:Subroutine;f:Function'
"<F2> to toggle the tag list window
noremap <silent> <F2> :TlistToggle <Enter>
