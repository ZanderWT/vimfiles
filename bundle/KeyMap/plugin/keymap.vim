""""""""""""""""""""""""
"   Mappings for vim   "
""""""""""""""""""""""""

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
"for some reason the above mapping of <Tab> overwrites <Ctrl-I>, this next
"mapping restores it to <Ctrl-U>.
nnoremap <C-U> <C-I>
"` to jump to the next buffer
nnoremap <silent> ` :bnext<CR>
nnoremap <silent> ~ :bprev<CR>
"<CR> in normal mode to insert a new blank line.
nnoremap <CR> o<Esc>
"jump to the next string enclosed by quotes with s and S
nnoremap <silent> s :call search('["'']\zs.\{-0,}["'']','')<Enter>
nnoremap <silent> S :call search('["'']\zs.\{-0,}["'']','b')<Enter>
"jump to the next area enclosed by parentheses with g( and g)
nnoremap <silent> g( :call search('(\zs.\{-0,})','')<Enter>
nnoremap <silent> g) :call search('(\zs.\{-0,})','b')<Enter>
"clear highlighted search mathces with <leader><space>
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
"use <leader>qt in normal mode to quit the current tab
nnoremap <silent> <leader>qt :tabc<Enter>
"use gp to paste text and then select it in visual mode
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
"<F3> to rebuild tag file in the current directory
nnoremap <silent> <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -ftags .<CR>
"in visual mode, VJ mapped to Vj.  I always hit VJ by accident when I really mean Vj.
nnoremap VJ Vj
"same for VK
nnoremap VK Vk
"paste from register 0, which contains the most recently yanked text
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
nnoremap <C-J> i<CR><ESC>
"<leader>cd to change local current working directory to the directory of the
"current file
nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

