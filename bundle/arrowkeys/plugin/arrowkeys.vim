function! BubbleLineUp()
  d x
  .-2put x
endfunction

function! BubbleLineDown()
  d x
  put x
endfunction

function! BubbleSelectionUp()
    silent '<,'>d x
    .-2put x
    normal! V'[V']
endfunction

function! BubbleSelectionDown()
    silent '<,'>d x
    put x
    normal! V'[V']
endfunction

function! SetArrowKeysAsTextShifters()
    " normal mode
    nnoremap <silent> <Left> <<
    nnoremap <silent> <Right> >>
    "nnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>
    nnoremap <silent> <Up> <Esc>:call BubbleLineUp()<CR>
    nnoremap <silent> <Down>  <Esc>:call BubbleLineDown()<CR>
 
    " visual mode
    vnoremap <silent> <Left> <gv
    vnoremap <silent> <Right> >gv
    vnoremap <silent> <Up> <Esc>:call BubbleSelectionUp()<CR>gv
    vnoremap <silent> <Down>  <Esc>:call BubbleSelectionDown()<CR>gv
 
 
endfunction
 
call SetArrowKeysAsTextShifters()

