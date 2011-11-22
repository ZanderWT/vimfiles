""""""""""""""""""""""""""""""""
"        Preamble              "
""""""""""""""""""""""""""""""""
set fileformats=unix,dos
set nocompatible
if has("win32")
  set runtimepath+=~/.vim
endif
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
set nowrap "no line wrapping (A mapping below binds <C-F6> to toggle line wrapping)
set ic "ignore case for searches
set smartcase "do not ignore case in search if the search query contains at least one uppercase letter
set clipboard=unnamed "set the default register for pasting and yanking to the windows clipboard
set diffexpr=MyDiff() "this was in the default vimrc file, better leave it alone
set shiftwidth=2
set tabstop=2
set expandtab
set laststatus=2 "always show the status line
if has("gui_running")
  if has("gui_win32")
    set guifont=Bitstream_Vera_Sans_Mono:h9,Courier_New:h9 "set font to bitstream vera sans mono if it's available, otherwise use courier new
  elseif has("gui_gtk2")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  endif
endif
set number "show line numbers
set undofile "use persistent undofiles to keep track of undo history betweem vim sessions
set undodir=~/.vimundo
set directory=~/.vimswp,. "use a separate directory for swap files
set completeopt=menuone,longest
let mapleader="," "use , instead of \ in mappings with <leader>
filetype plugin indent on
""""""""""""""""""""""""""""""""""
"         Autocommands           "
""""""""""""""""""""""""""""""""""
if has("gui_win32")
  autocmd GUIEnter * simalt ~x "start maximized
endif
"reveal all folds
autocmd BufRead  * normal zR 
"Create folds based on indent and then set foldmethod to manual when openeing
"a buffer
au BufReadPre * setlocal foldmethod=indent
au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif

"automatically source the _vimrc file when writing it
au BufWritePost _vimrc so $MYVIMRC
au BufWritePost .vimrc so $MYVIMRC

""""""""""""""""""""""""""""""""
"     Settings for java        "
""""""""""""""""""""""""""""""""
"use java omnicompletion
autocmd Filetype java,javascript,jsp setlocal tags=./tags,tags,E:/JavaWeb/tags,E:/jdk/src/tags,E:/libs/struts-1.3.10/tags
autocmd Filetype java,javascript,jsp nnoremap <buffer> <Leader>ce  :CVSEdit<CR>
autocmd Filetype java,javascript,jsp nnoremap <buffer> <Leader>cE  :CVSEditors<CR>
autocmd Filetype java,javascript,jsp nnoremap <buffer> <Leader>ct  :CVSUnedit<CR>
autocmd Filetype java,javascript,jsp nnoremap <buffer> <Leader>cwv :CVSWatchers<CR>
autocmd Filetype java,javascript,jsp nnoremap <buffer> <Leader>cwa :CVSWatchAdd<CR>
autocmd Filetype java,javascript,jsp nnoremap <buffer> <Leader>cwn :CVSWatchOn<CR>
autocmd Filetype java,javascript,jsp nnoremap <buffer> <Leader>cwf :CVSWatchOff<CR>
autocmd Filetype java,javascript,jsp nnoremap <buffer> <Leader>cwf :CVSWatchRemove<CR>

""""""""""""""""""""""""""""""""""
"           Mappings             "
""""""""""""""""""""""""""""""""""
"<F4> to toggle most recently used documents window
noremap  <silent> <F4> :if bufname("%") != "__MRU_FILES__"<Enter>MRU<Enter>else<Enter>exe"q" <Enter>endif<Enter> 
"<F3> to execute the contents of register q -- useful when a macro is recorded
"into register q
nnoremap <F3> @q
"<C-F6> toggles line-wrapping
nnoremap <silent> <C-F6> :set invwrap<Enter>:set invlinebreak<Enter>
"<F9> shows the color group of the identifier under the cursor
noremap <C-F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
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
"<F3> to rebuild tag file in the current directory
nnoremap <silent> <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -ftags .<CR>
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
"ctrl-h and ctrl-l to move to the beginning and end of a line
nnoremap <c-h> ^
nnoremap <c-l> $
"Ctrl-J to split a line, like Shift-J joins two lines
nnoremap <C-J> gEa<CR><ESC>ew
"<leader>cd to change local current working directory to the directory of the
"current file
nnoremap <silent> <leader>cd :lcd %:p:h<CR>

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
nnoremap <silent> <F1> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1 "close NERDtree after opening a file
"Config for MRU:
let g:MRU_Ignore_Case = 1

"Config for OmniCppComplete:
let OmniCpp_NamespaceSearch = 2

"Config for TagList
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Process_File_Always = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Close_On_Select = 1
let g:tlist_vb_settings = 'vb;s:Subroutine;f:Function'
"<F2> to toggle the tag list window
noremap <silent> <F2> :TlistToggle <Enter>

"Config for Eclim:
let g:taglisttoo_disabled = 1
let g:EclimTaglistEnabled = 0
let g:EclimSignLevel=2 "suppress warnings
let g:EclimValidateSortResults='severity' "sort validation problems by severity
let g:EclimJavaImportPackageSeparationLevel=0 "don't add newlines between import statements

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

"Config for vcscommand
let g:VCSCommandEnableBufferSetup=1
nnoremap <leader>cE           :CVSEditors<CR>
nnoremap <leader>cwv          :CVSWatchers<CR>
nnoremap <leader>cwa          :CVSWatchAdd<CR>
nnoremap <leader>cwf          :CVSWatchOff<CR>
nnoremap <leader>ce           :CVSEdit<CR>
nnoremap <leader>ct           :CVSUnedit<CR>
nnoremap <leader>cwn          :CVSWatchOn<CR>

"use the plains colorscheme
colorscheme plains

"Config for SuperTab:
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

"Config for Gundo:
nnoremap <silent> <F9> :GundoToggle<CR>
vnoremap <silent> <F9> :GundoToggle<CR>
let g:gundo_preview_bottom=1
let g:gundo_right=1
"""""""""""""""""""""""""""""""
"        Functions            "
"""""""""""""""""""""""""""""""

" Find file with search everything and edit it.
function! Find(name)
  if has("unix")
    let l:cmd="locate"
  else "windows
    let l:cmd="es"
  endif
  let l:list=split(system(l:cmd." ".a:name),"\n")
  let l:num=len(l:list)
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    let l:count = 1
    for l:item in l:list
      let l:item = l:count.": ".l:item
      echo l:item
      let l:count+=1
    endfor  
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=l:list[l:input - 1]
  else
    let l:line=l:list[0]
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 F :call Find("<args>")
command! -nargs=1 Ft :tabe|:call Find("<args>")
"<leader>f to start the Find command
nnoremap <leader>f :F 

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
  new
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
