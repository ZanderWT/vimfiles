""""""""""""""""""""""""""""""""""
"           Mappings             "
""""""""""""""""""""""""""""""""""
"<leader>l to jump to a line in a VB program
nnoremap <silent> <leader>l :VBLine 
"jump to the next VB6 function or sub declaration
nnoremap <silent> gs :call search('\(public\\|private\) \(sub\\|function\) \zs','')<Enter>
nnoremap <silent> gS :call search('\(public\\|private\) \(sub\\|function\) \zs','b')<Enter>
vnoremap <silent> gs :call search('\(public\\|private\) \(sub\\|function\) \zs','')<Enter>
vnoremap <silent> gS :call search('\(public\\|private\) \(sub\\|function\) \zs','b')<Enter>

""""""""""""""""""""""""""""""""""
"           Settings             "
""""""""""""""""""""""""""""""""""
set tags+=E:\RMS\tags

""""""""""""""""""""""""""""""""""
"           Functions            "
""""""""""""""""""""""""""""""""""
function! VbLine(lineNo)
  call search('Option Explicit', 'w')
  let l:newLine = line('.') + a:lineNo - 1
  echo l:newLine
  call cursor(l:newLine, 0)
endfunction
command! -nargs=1 VBLine :call VbLine("<args>")
