"Vimeverything: use everything search from within vim

"Configuration variables
let VimES_winTitle = "Vim Everything"
let VimES_winHeight = 12

"temporary mappings for testing:
nnoremap <leader>f :VimESToggle<CR>

"VimES_toggleWindow
"open the search window if it's closed, close it if it's open
function! s:VimES_toggleWindow()
    "close the window if it's open
    let winnum = bufwinnr(g:VimES_winTitle)
    if winnum != -1
        call s:VimES_closeWindow()
        return
    endif
    call s:VimES_openWindow()
endfunction

"VimES_closeWindow
"close the search window
function! s:VimES_closeWindow()
    "exit if the window doesn't exist
    let winnum = bufwinnr(g:VimES_winTitle)
    if winnum == -1
        return
    endif

    if winnr() == winnum
        "if we're already in the search window, close it unless it's the only
        "open window
        if winbufnr(2) != -1
            close
        endif
    else
        "close the search window
        let curbufnum = bufnr('%')
        exe winnum . 'wincmd w'
        close
        "jump back to the original window
        let winnum = bufwinnr(curbufnum)
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
    endif
endfunction

"VimES_windowOpen
"open the search window
function! s:VimES_openWindow()
    let winnum = bufwinnr(g:VimES_winTitle)
    if winnum != -1
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
        return
    endif
    
    "mark the current window as the default window to open the selected file in
    call s:VimES_markCurrentWindow()

    "open the search window
    call s:VimES_createSearchWindow()
endfunction

"VimES_markCurrentWindow()
"mark the current window as the default window in which to open the selected
"file.  Only mark if it is not a plugin, preview, or search window
function! s:VimES_markCurrentWindow()
    if getbufvar('%', '&buftype') == '' && !&previewwindow
        let w:vimes_fileWindow = "yes"
    endif
endfunction

"VimES_createSearchWindow()
"create the search window. Jump to the search window if it is already open
function! s:VimES_createSearchWindow()
    "jump to the window if it is already open
    let winnum = bufwinnr(g:VimES_winTitle)
    if winnum != -1
        "jump the the window
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
        return
    endif

"Create a new window to be the search window
    let winDir = 'botright'
    let winHeight = g:VimES_winHeight
    
    "if the search buffer exists already, then reuse it
    let bufnum = bufnr(g:VimES_winTitle)
    if bufnum == -1
        "create a new buffer
        let wcmd = g:VimES_winTitle
    else
        "edit the existing search buffer
        let wcmd = '+buffer' . bufnum
    endif

    "Create the window
    exe 'silent! ' . winDir . ' ' . winHeight . 'split ' . wcmd 

    "save the position of the new window
    let s:VimES_winX = getwinposx()
    let s:VimES_winY = getwinposy()

    "initialize the search window
    call s:VimES_initWindow()
endfunction

"VimES_initWindow()
"initializes the search window.
function! s:VimES_initWindow()
    "readonly should not be set so the user can enter the search query
    setlocal noreadonly

    setlocal filetype=vimeverything

    "TODO implement highlighting

    "options configuration:
    silent! setlocal buftype=nofile "The buffer is marked as scratch
    silent! setlocal noswapfile "Don't use a swap file for the buffer
    silent! setlocal nobuflisted "the buffer won't appear in the buffer list
    silent! setlocal nowrap
    silent! setlocal number "show line numbers
    silent! setlocal winfixheight "fix the window height
endfunction


"user commands to control search window
command! -nargs=0 -bar VimESToggle call s:VimES_toggleWindow()
command! -nargs=0 -bar VimESOpen call s:VimES_openWindow()
