"don't insert comment leaders automatically
setlocal formatoptions-=c
setlocal formatoptions-=r
setlocal formatoptions-=o

function! EclimJavaFormat()
  let l:endline = v:lnum + v:count - 1
  echom v:lnum
  echom v:count
  echom l:endline
  echom v:lnum . "," . l:endline . "JavaFormat" 
  exe v:lnum . "," . l:endline . "JavaFormat"
endfunction

setlocal formatexpr=EclimJavaFormat()
