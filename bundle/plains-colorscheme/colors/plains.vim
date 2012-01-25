"Plains color scheme by Zander Thompson

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
  syntax reset
    endif
endif
let g:colors_name="plains"


hi Normal guifg=#faf4c6 guibg=#3f3f3f
"hi Normal guifg=wheat guibg=#3f3f3f

" highlight groups
hi Cursor       guibg=khaki guifg=slategrey
hi DiffAdd      guibg=#4f4f4f gui=bold
hi DiffDelete   guifg=black guibg=#4f4f4f gui=bold
hi DiffChange   guibg=#5f4f5f gui=bold
hi DiffText     guibg=#6f2f3f gui=bold
hi ErrorMsg     guifg=#EEEED0 guibg=red gui=none
hi VertSplit    guifg=grey50 guibg=#c2bfa5 gui=none
hi Folded       guifg=gold guibg=grey30 gui=none
hi FoldColumn   guifg=tan guibg=grey30 gui=none
hi IncSearch    guifg=slategrey guibg=khaki gui=none
hi LineNr       guifg=#ccccb0 guibg=#454545 gui=none
hi ModeMsg      guifg=goldenrod gui=none
hi MoreMsg      guifg=#EEEED0 guibg=red gui=none
hi NonText      guifg=grey50 gui=none
hi SpecialKey   guifg=grey50 gui=none
hi Question     guifg=springgreen gui=none
hi Search       guifg=white guibg=peru gui=none
hi StatusLine   guifg=black guibg=tan gui=none
hi StatusLineNC guifg=grey30 guibg=#c2bfa5 gui=none
hi Title        guifg=indianred gui=none
hi Visual       guifg=khaki guibg=#005879
hi WarningMsg   guifg=#EEEED0 guibg=red gui=none
hi Pmenu        guibg=#4f4f4f guifg=khaki
hi PmenuSel     guifg=khaki guibg=#005879 
hi PmenuSbar    guifg=#ccccb0 guibg=#454545 

" syntax highlighting groups
hi Comment          guifg=#7f9f7f gui=NONE
"hi Special          guifg=#7f9fbf gui=NONE
hi Constant         guifg=#ffaD5B  gui=NONE
hi Identifier       guifg=skyblue gui=none
hi Statement        guifg=khaki gui=NONE
hi PreProc          guifg=#cac496 gui=NONE
hi Type             guifg=darkkhaki gui=NONE
hi Special          guifg=navajowhite gui=NONE
hi Ignore           guifg=grey40 gui=NONE
hi Todo             guifg=orangered guibg=yellow2 gui=NONE
hi Operator         guifg=#B8E377 gui=NONE
hi MatchParen       guifg=#B8E377 guibg=#775555 gui=NONE
hi javaParen        guifg=#B8E377 gui=NONE
hi Number           guifg=#EA704D gui=NONE

" color terminal definitions
hi SpecialKey       ctermfg=darkgreen
hi NonText          cterm=bold ctermfg=darkblue
hi Directory        ctermfg=darkcyan
hi ErrorMsg         cterm=bold ctermfg=7 ctermbg=1
hi IncSearch        cterm=NONE ctermfg=yellow ctermbg=green
hi Search           cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg          ctermfg=darkgreen
hi ModeMsg          cterm=NONE ctermfg=brown
hi LineNr           ctermfg=3
hi Question         ctermfg=green
hi StatusLine       cterm=bold,reverse
hi StatusLineNC     cterm=reverse
hi VertSplit        cterm=reverse
hi Title            ctermfg=5
hi Visual           cterm=reverse
hi VisualNOS        cterm=bold,underline
hi WarningMsg       ctermfg=1
hi WildMenu         ctermfg=0 ctermbg=3
hi Folded           ctermfg=darkgrey ctermbg=NONE
hi FoldColumn       ctermfg=darkgrey ctermbg=NONE
hi DiffAdd          ctermbg=4
hi DiffChange       ctermbg=5
hi DiffDelete       cterm=bold ctermfg=4 ctermbg=6
hi DiffText         cterm=bold ctermbg=1
hi Comment          ctermfg=darkcyan
hi Constant         ctermfg=brown
hi Special          ctermfg=5
hi Identifier       ctermfg=6
hi Statement        ctermfg=3
hi PreProc          ctermfg=5
hi Type             ctermfg=2
hi Underlined       cterm=underline ctermfg=5
hi Ignore           cterm=bold ctermfg=7
hi Ignore           ctermfg=darkgrey
hi Error            cterm=bold ctermfg=7 ctermbg=1
