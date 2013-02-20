"config for Taglist plugin.  needs to be run after the plugin is loaded
if loaded_taglist=='yes'
  "show useful information on the status line
  set statusline=%([%M%R]\ %)%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)%=%l,%c\
else
  "show useful information on the status line, not including taglist
  set statusline=%([%M%R]\ %)%f\ %=%l,%c
endif
