""""""""""""""""""""""""""""""""
"        Preamble              "
""""""""""""""""""""""""""""""""
set nocompatible
if has("win32")
  set runtimepath+=~/.vim
endif
call pathogen#infect('~/.vim/bundle')
filetype plugin indent on

""""""""""""""""""""""""""""""""
"          Set Options         "
""""""""""""""""""""""""""""""""
behave mswin
syntax on "Switch syntax highlighting on, when the terminal has colors
set backspace=indent,eol,start " allow backspacing over everything in insert mode
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
set incsearch "incremental search
set ic "ignore case for searches
set hlsearch "highlight search results
set smartcase "do not ignore case in search if the search query contains at least one uppercase letter
set clipboard=unnamed "set the default register for pasting and yanking to the windows clipboard
set diffexpr=MyDiff() "Standard diff expr
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set laststatus=2 "always show the status line
set list "be in list mode
set listchars=tab:>-,trail:· "display hard tabs as >--- and trailing spaces as ·
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if has("gui_running")
  if has("gui_win32")
    set guifont=Bitstream_Vera_Sans_Mono:h9,Courier_New:h9 "set font to bitstream vera sans mono if it's available, otherwise use courier new
  elseif has("gui_gtk2")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  endif
endif
set number "show line numbers
set undofile "use persistent undofiles to keep track of undo history betweem vim sessions
set undodir=~/.vim/.vimundo
set directory=~/.vim/.vimswp,. "use a separate directory for swap files
set completeopt=menuone,longest
"don't insert comment leaders automatically
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o
let mapleader="," "use , instead of \ in mappings with <leader>
colorscheme plains "use the plains colorscheme
""""""""""""""""""""""""""""""""""
"         Autocommands           "
""""""""""""""""""""""""""""""""""
if has("gui_running") && has("win32")
  autocmd GUIEnter * simalt ~x "start maximized
endif
"reveal all folds
autocmd BufRead  * normal zR
"Create folds based on indent and then set foldmethod to manual when openeing
"a buffer
au BufReadPre * setlocal foldmethod=indent
au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


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

"""""""""""""""""""""""""""""""
"        Functions            "
"""""""""""""""""""""""""""""""

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif

" Find file with search everything and edit it.
function! s:Find(name)
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
command! -nargs=1 F :call <SID>Find("<args>")
command! -nargs=1 Ft :tabe|:call <SID>Find("<args>")
"<leader>f to start the Find command
nnoremap <leader>f :F 

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
