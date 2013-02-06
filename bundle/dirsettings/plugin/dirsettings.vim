"
" Plugin: dirsettings
"
" Version: 1.0
"
" Description:
"
"   This is a very simple plugin that allows for directory tree-specific vim
"   settings.  For every file edited, it searches upward from that file's
"   directory for a file named '.vimdir' and sources it.
"
" Maintainer: Tye Z. < z d r o @ y a h o o . c o m >
"
" 

if version < 700
    finish
endif

" Define a group so we can delete them when this file is sourced, and we don't
" end up with multiple autocmd entries if this file is sourced more than once.
augroup dirsettings
au! dirsettings
au dirsettings BufNewFile,BufReadPost * call SourceFileUpward('.vimdir')
au dirsettings BufReadPost .vimdir set filetype=vim

"
" Search upward for the given file and source it. Also lcd to that file's
" directory  This makes for a simpler
" autocmd line.
"
func! SourceFileUpward(fname)
    "added a try/catch block to make the command fail silently in buffers
    "without a valid working directory
    try
        exe 'lcd ' . escape(expand("%:p:h"), ' ')
        let l:flist=FindFileUpward(a:fname)
        for l:fname in reverse(l:flist)
          if filereadable(l:fname)
              exe 'sou ' . l:fname
              exe 'lcd ' . fnamemodify(l:fname, ":h")
          endif
        endfor
    catch

    endtry
endfunc

"
" Search upward for the given file.
"
func! FindFileUpward(fname)
    let l:flist=findfile(a:fname, escape(expand("%:p:h"), ' ') . '.;', -1)
    return l:flist
endfunc
