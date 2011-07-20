let g:Grep_Default_Options = '-i'
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        execute "copen"
    endif
endfunction
 
" Used to track the quickfix window.
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
" '\g' : grep all open buffers
:noremap <Leader>g <Esc>:GrepBuffer <CR>
 
" '\gg' : grep all open buffers for word under cursor
:noremap <Leader>gg <Esc>:GrepBuffer <C-R><C-W><CR>
 
" '\G' : recursively grep through filesystem
:noremap <Leader>G <Esc>:Rgrep<CR>
 
" '\q' : toggle QuickFix window (errors and vimgrep results here)
noremap <silent><leader>q <Esc>:call QFixToggle(0)<CR>
 
" '[q' previous quickfix entry
noremap [q :cprev<CR>
 
" ']q' next quickfix entry
noremap ]q :cnext<CR>
