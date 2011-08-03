"config for Taglist plugin.  needs to be run after the plugin is loaded
if exists('loaded_taglist')
  let g:Tlist_Auto_Highlight_Tag = 1
  let g:Tlist_Process_File_Always = 1
  let g:Tlist_Exit_OnlyWindow = 1
  let g:Tlist_Show_One_File = 1
  let g:Tlist_GainFocus_On_ToggleOpen = 1
  let g:Tlist_Close_On_Select = 1
  let g:tlist_vb_settings = 'vb;s:Subroutine;f:Function'
  set statusline=%([%M%R]\ %)%F\ %([%{Tlist_Get_Tagname_By_Line()}]%)%=%l,%c\  "show useful information on the status line
endif
