function! DelEmptyLineAbove()
    if line(".") == 1
        return
    endif
    let l:line = getline(line(".") - 1)
    if l:line =~ '^\s*$'
        let l:colsave = col(".")
        .-1d
        silent normal! <C-y>
        call cursor(line("."), l:colsave)
    endif
endfunction
 
function! AddEmptyLineAbove()
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    set scrolloff=0
    call append(line(".") - 1, "")
    if winline() != winheight(0)
        silent normal! <C-e>
    endif
    let &scrolloff = l:scrolloffsave
endfunction
 
function! DelEmptyLineBelow()
    if line(".") == line("$")
        return
    endif
    let l:line = getline(line(".") + 1)
    if l:line =~ '^\s*$'
        let l:colsave = col(".")
        .+1d
        ''
        call cursor(line("."), l:colsave)
    endif
endfunction
 
function! AddEmptyLineBelow()
    call append(line("."), "")
endfunction

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
    nnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
    nnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>
 
    " visual mode
    vnoremap <silent> <Left> <gv
    vnoremap <silent> <Right> >gv
    vnoremap <silent> <Up> <Esc>:call BubbleSelectionUp()<CR>gv
    vnoremap <silent> <Down>  <Esc>:call BubbleSelectionDown()<CR>gv
    vnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>gv
    vnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>gv
 
 
endfunction
 
call SetArrowKeysAsTextShifters()

