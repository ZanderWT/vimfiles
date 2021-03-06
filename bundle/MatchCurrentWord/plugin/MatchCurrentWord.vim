"zthompso 11/21/2011: created
"plugin to always highlight the current word
hi clear MatchCurrentWord
hi MatchCurrentWord guibg=#4f4f4f 
hi MatchCurrentWord ctermbg=238

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
  if exists('g:MatchCurrentWord_priority')
    let l:matchPriority = g:MatchCurrentWord_priority
  else
    let l:matchPriority = -1
  endif
  silent! call matchdelete(l:matchID)
  call matchadd(l:hlGroup, '\V\<' . escape(expand('<cword>'), '\') . '\>', l:matchPriority, l:matchID)
endfunction
