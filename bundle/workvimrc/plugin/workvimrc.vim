"workvimrc:  Contains mappings, configurations and functions I use at work.
if $COMPUTERNAME != "LPRGSTARSKY"
  finish
endif
cd E:/ "start in E:/

""""""""""""""""""""""""""""""""""
"       Option Settings          "
""""""""""""""""""""""""""""""""""
set grepprg=egrep\ -nHi

""""""""""""""""""""""""""""""""""
"          AutoCommands          "
""""""""""""""""""""""""""""""""""
autocmd Filetype cpp setlocal tags=./tags,tags,E:\PROGRA~1\DEVSTU~1\VC98\Include\tags

""""""""""""""""""""""""""""""""""
"          Functions             "
""""""""""""""""""""""""""""""""""

function! BuildBugsCleanUp()
  execute "sort i"
  let line = 1
  let lastline = line("$")
  let matchpat = "^.\\+\\(\\s\\+(\\d\\+)$\\)\\@="
  while line < lastline
    let compthis = matchstr(getline(line),matchpat)
    let compthat = matchstr(getline(line + 1),matchpat)
    if (compthis == compthat)
      let linetext = getline(line)
      call setline(line,"\t* " . linetext)
      echo compthis
      echo compthat
    endif
    let line = line + 1
  endwhile
endfunction
