"config for Taglist plugin.  needs to be run after the plugin is loaded
if exists('loaded_taglist')
  set statusline=%([%M%R]\ %)%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)%=%l,%c\  "show useful information on the status line
endif
