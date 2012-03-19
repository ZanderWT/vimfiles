"WindowManagement.vim: a set of functions and keybinds to make window
"management in vim sane.

"move to the window in the direction of [key].  If there is only one window,
"create a new one in the direction of [key]
function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
 
nnoremap <C-w>h              :call WinMove('h')<cr>
nnoremap <C-w>k              :call WinMove('k')<cr>
nnoremap <C-w>l              :call WinMove('l')<cr>
nnoremap <C-w>j              :call WinMove('j')<cr>

nnoremap <C-w><C-h>              :call WinMove('h')<cr>
nnoremap <C-w><C-k>              :call WinMove('k')<cr>
nnoremap <C-w><C-l>              :call WinMove('l')<cr>
nnoremap <C-w><C-j>              :call WinMove('j')<cr>

nnoremap <C-w>H              :wincmd H<cr>
nnoremap <C-w>K              :wincmd K<cr>
nnoremap <C-w>L              :wincmd L<cr>
nnoremap <C-w>J              :wincmd J<cr>
