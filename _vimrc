set nocompatible
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""""""""""""""""""""""""""""""""
"      Sourced files           "
""""""""""""""""""""""""""""""""
source $VIMRUNTIME/vimrc_example.vim

""""""""""""""""""""""""""""""""
"          Set Options         "
""""""""""""""""""""""""""""""""
"mswin.vim considered harmful
"source $VIMRUNTIME/mswin.vim
behave mswin
set selection=inclusive "override 'selection' variable that is set to exclusive by behave mswin
"set GUI options:
set guioptions+=b "enable horizontal scrollbar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions+=c  "Use console dialogs instead of popups
set confirm "confirm save/discard/cancel when abandoning a buffer
set nobackup "Don't leave backup around after writing the file
set writebackup "Don't leave backup around after writing the file
set nowrap "no line wrapping (A mapping below binds F6 to toggle line wrapping)
set ic "ignore case for searches
set smartcase "do not ignore case in search if the search query contains at least one uppercase letter
set clipboard=unnamed "set the default register for pasting and yanking to the windows clipboard
set diffexpr=MyDiff() "this was in the default vimrc file, better leave it alone
set shiftwidth=2
set tabstop=2
set expandtab
set laststatus=2 "always show the status line
set guifont=Bitstream_Vera_Sans_Mono:h9,Courier_New:h9 "set font to bitstream vera sans mono if it's available, otherwise use courier new
set number "show line numbers
set undodir=~/_vimundo
set undofile
let mapleader="," "use , instead of \ in mappings with <leader>
filetype plugin indent on
colorscheme plains "preferred colorscheme
""""""""""""""""""""""""""""""""""
"         Autocommands           "
""""""""""""""""""""""""""""""""""
autocmd Filetype cpp setlocal tags=./tags,tags,E:\PROGRA~1\DEVSTU~1\VC98\Include\tags
autocmd GUIEnter * simalt ~x "start maximized
autocmd BufEnter * lcd %:p:h
"reveal all folds
autocmd BufRead  * normal zR 
"Create folds based on indent and then set foldmethod to manual when openeing
"a buffer
au BufReadPre * setlocal foldmethod=indent
au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif

""""""""""""""""""""""""""""""""
"     Settings for java        "
""""""""""""""""""""""""""""""""
"use java omnicompletion
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd Filetype java setlocal tags=./tags,tags,E:/JavaWeb/tags,E:/jdk/src/tags
"mapping for code completetion
autocmd Filetype java inoremap <buffer> <C-S-Space> <C-X><C-P>
"errorformat for parsing ant errors
autocmd Filetype java setlocal makeprg=ant
autocmd Filetype java setlocal efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
autocmd Filetype java nnoremap <buffer> <Leader>ce  :CVSEdit<CR>
autocmd Filetype java nnoremap <buffer> <Leader>cE  :CVSEditors<CR>
autocmd Filetype java nnoremap <buffer> <Leader>ct  :CVSUnedit<CR>
autocmd Filetype java nnoremap <buffer> <Leader>cwv :CVSWatchers<CR>
autocmd Filetype java nnoremap <buffer> <Leader>cwa :CVSWatchAdd<CR>
autocmd Filetype java nnoremap <buffer> <Leader>cwn :CVSWatchOn<CR>
autocmd Filetype java nnoremap <buffer> <Leader>cwf :CVSWatchOff<CR>
autocmd Filetype java nnoremap <buffer> <Leader>cwf :CVSWatchRemove<CR>

""""""""""""""""""""""""""""""""""
"           Mappings             "
""""""""""""""""""""""""""""""""""
"<F3> show marks a-z
nnoremap <silent> <F3> :marks abcdefghijklmnopqrstuvwxyz<Enter>
"<F4> to toggle most recently used documents window
noremap  <silent> <F4> :if bufname("%") != "__MRU_FILES__"<Enter>MRU<Enter>else<Enter>exe"q" <Enter>endif<Enter> 
"<F5> to execute the contents of register q -- useful when a macro is recorded
"into register q
nnoremap <F5> @q
"<F6> toggles line-wrapping
nnoremap <silent> <F6> :set invwrap<Enter>:set invlinebreak<Enter>
"<F9> shows the color group of the identifier under the cursor
noremap <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"use ; to enter command line mode
vnoremap ; :
nnoremap ; :
"use : for the old functionality of ;
nnoremap : ;
vnoremap : ;
"use ctrl + k, j to make windows taller or shorter
nnoremap <C-k> 4<C-W>+
nnoremap <C-j> 4<C-W>-
"scroll left and right with H and L
noremap L z40l
noremap H z40h
"scroll up and down, keeping the cursor in the same spot, with <Space> and <S-Space>
nnoremap <Space> 10<c-e>
nnoremap <S-Space> 10<c-y>
vnoremap <Space> 10<c-e>
vnoremap <S-Space> 10<c-y>
"tab to jump to the minibufexpl window
nnoremap <silent> <Tab> :BufExplorer<CR>
"s-tab to open the bufexpl window in a split window
nnoremap <silent> <S-Tab> :BufExplorerHorizontalSplit<CR> 
"` to jump to the next buffer
nnoremap <silent> ` :bnext<CR>
nnoremap <silent> ~ :bprev<CR>
"for some reason the above mapping of <Tab> overwrites <Ctrl-I>, this next
"mapping restores it to <Ctrl-U>.
nnoremap <C-U> <C-I>
"<CR> in normal mode to insert a new blank line.
nnoremap <CR> o<Esc>
"jump to the next string enclosed by quotes with s and S
nnoremap <silent> s :call search('["'']\zs.\{-0,}["'']','')<Enter>
nnoremap <silent> S :call search('["'']\zs.\{-0,}["'']','b')<Enter>
"jump to the next area enclosed by parentheses with g( and g)
nnoremap <silent> g( :call search('(\zs.\{-0,})','')<Enter>
nnoremap <silent> g) :call search('(\zs.\{-0,})','b')<Enter>
"clear the search buffer with <leader><space>
nnoremap <silent> <leader><space> :nohlsearch<CR>
"use j and k to traverse editor lines instead of file lines.  useful when wrap
"is turned on.
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk
"Stay in visual mode when indenting text
vnoremap > >gv
vnoremap < <gv
"<leader>v to edit this file
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
"<leader>d to enter today's date
nnoremap <silent> <leader>t "=strftime("%m/%d/%Y")<CR>p
"<leader>n to enter 'zthompso'
nnoremap <silent> <leader>n "='zthompso'<CR>p
"Same as above two mappings for insert mode, but hit leader twice
inoremap <silent> <leader><leader>t <C-R>=strftime("%m/%d/%Y")<CR><SPACE>
inoremap <silent> <leader><leader>n zthompso<space>
"Add a \v to searches to always use 'very magic' mode. all punctuation
"characters will be interpreted as RegEx control characters.  Currently
"disabled
"nnoremap / /\v
"nnoremap ? ?\v
"use <leader>qt in normal mode to close the current tab
nnoremap <silent> <leader>qt :tabc<Enter>
"use gp to paste text and then select it in visual mode
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
"<F11> to rebuild tag file in the current directory
nnoremap <silent> <F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -ftags .<CR>
"in visual mode, VJ mapped to Vj.  I always hit VJ by accident when I really mean Vj.
nnoremap VJ Vj
"same for VK
nnoremap VK Vk
nnoremap <silent> <leader>p "0p
nnoremap <silent> <leader>P "0P
vnoremap <silent> <leader>p "0p
vnoremap <silent> <leader>P "0P
"Y to yank from the cursor to the end of the line
nnoremap Y y$
vnoremap Y y$
"< C-> > and < C-< > to move through the quickfix list
nnoremap <silent> <C-,> :cprev<CR>
nnoremap <silent> <C-,> :cnext<CR>
"""""""""""""""""""""""""
"     color groups      "
"""""""""""""""""""""""""
hi link cNumber Number
hi link cFloat Number
hi link cOctal Number
hi link javaParen Operator
hi link javaParen1 Operator
hi link javaParen2 Operator
hi Pmenu guifg=wheat guibg=#3f3f1f 

"""""""""""""""""""""""""""""""""""""
"      Plugin Configurations        "
"""""""""""""""""""""""""""""""""""""
"Config for NERDTree:
nnoremap <silent> <F12> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1 "close NERDtree after opening a file
"Config for MRU:
let g:MRU_Ignore_Case = 1

"Config for OmniCppComplete:
set completeopt-=preview
let OmniCpp_NamespaceSearch = 2

"Config for TagList is in after/plugin/TagListConfig.vim

"Config for EasyMotion
hi EasyMotionShade guifg=#7f9f7f gui=NONE
hi EasyMotionTarget guifg=khaki gui=NONE
let g:EasyMotion_mapping_f = ',F'

"Config for paramter_objects
let g:no_parameter_object_maps=1
vmap     <silent> i, <Plug>ParameterObjectI
omap     <silent> i, <Plug>ParameterObjectI
vmap     <silent> a, <Plug>ParameterObjectA
omap     <silent> a, <Plug>ParameterObjectA

"Config for solarized color scheme
 function! ToggleBackground()
     if (w:solarized_style=="dark")

     let w:solarized_style="light"
     colorscheme solarized
 else
     let w:solarized_style="dark"
     colorscheme solarized
 endif
 endfunction
 command! Togbg call ToggleBackground()
 "nnoremap <F1> :call ToggleBackground()<CR>
" option name               default     optional
"" ------------------------------------------------
" g:solarized_termcolors=   256      "|   16
" g:solarized_termtrans =   0        "|   1
" g:solarized_degrade   =   0        "|   1
" g:solarized_bold      =   1        "|   0
" g:solarized_underline =   1        "|   0
" g:solarized_italic    =   1        "|   colorscheme solarized
" g:solarized_style     =   'light'   "|   'light'
" g:solarized_contrast  =   'normal' "|   'high' or 'low'
"" ------------------------------------------------
"set background=dark
"colorscheme solarized
"""""""""""""""""""""""""""""""
"        Functions            "
"""""""""""""""""""""""""""""""
"jump to directly to a tag if it is found in the current file, otherwise
"display the tag list
function! SmartTagJump(split)
    let l:cword = expand('<cword>')
    if a:split == 1
        exe 'tab split'
    endif
    let l:taglist = taglist('^' . l:cword . '$')
    let l:foundMatch = 0
    for l:tag in l:taglist
        if match(l:tag['filename'], expand('%:t') . '$') != -1
            "exe l:tag['cmd']
            exe 'tag ' . tag['name']
            let l:foundMatch = 1
            break
        endif
    endfor
    if l:foundMatch == 0
        if &modified && a:split == 0
          exe 'tab split'
        endif
        try
          exe 'tj ' . l:cword
        catch
          exe "tabc"
          echo "Tag not found!"
        endtry
    endif
endfunction
nnoremap <silent> ]t :call SmartTagJump(0)<CR>
nnoremap <silent> ]T :call SmartTagJump(1)<CR>
nnoremap [t <C-t>

"redirect to output of a command to a scratch buffer
"useful for spammy commands like :hi, :reg, :au
"includes a mapping <leader>r to call the function
function! RedirectToScratch(cmd)
  tabnew
  :set buftype=nofile
  :set bufhidden=hide
  :setlocal noswapfile
  redir => m 
  silent exe a:cmd 
  redir END
  put =m
endfunction
command! -nargs=1 RedirToScratch :call RedirectToScratch("<args>")
nnoremap <leader>r :RedirToScratch 

"This is the default Diffexpr.
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

