"zthompso 11/21/2011: created
"plugin to always highlight the current word
hi clear MatchCurrentWord
hi MatchCurrentWord guibg=#4f4f4f 
augroup MatchCurrentWord
  au!
  au CursorMoved * call MatchWord()
augroup END

function! MatchWord()
  if exists('g:MatchCurrentWord_hlGroup')
    let l:hlGroup = g:MatchCurrentWord_hlGroup
  else
    let l:hlGroup = 'MatchCurrentWord'
  endif
  if exists('g:MatchCurrentWord_matchID')
    let l:matchID = g:MatchCurrentWord_matchID
  else
    let l:matchID = 4
  endif
  silent! call matchdelete(l:matchID)
  call matchadd(l:hlGroup, '\<' . expand('<cword>') . '\>', 10, l:matchID)
endfunction

