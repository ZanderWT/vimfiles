"fix broken crap with unimpaired
unmap [a
unmap ]a
unmap ]A
unmap [A
unmap [b
unmap ]b
unmap ]B
unmap [B
unmap [l
unmap ]l
unmap ]L
unmap [L
unmap [q
unmap ]q
unmap ]Q
unmap [Q
unmap [t
unmap ]t
unmap ]T
unmap [T


function! s:MapNextFamily(map,cmd)
  let end = ' ".(v:count ? v:count : "")<CR>'
  execute 'nnoremap <silent> ['.a:map.' :<C-U>exe "'.a:cmd.'previous'.end
  execute 'nnoremap <silent> ]'.a:map.' :<C-U>exe "'.a:cmd.'next'.end
  execute 'nnoremap <silent> ['.toupper(a:map).' :<C-U>exe "'.a:cmd.'first'.end
  execute 'nnoremap <silent> ]'.toupper(a:map).' :<C-U>exe "'.a:cmd.'last'.end
endfunction

call s:MapNextFamily('a','')
call s:MapNextFamily('b','b')
call s:MapNextFamily('l','l')
call s:MapNextFamily('q','c')
call s:MapNextFamily('t','t')
