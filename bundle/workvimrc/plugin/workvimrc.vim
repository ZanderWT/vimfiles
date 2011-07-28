"workvimrc:  Contains mappings, configurations and functions I use at work.
if $COMPUTERNAME != "LPRGSTARSKY"
  finish
endif
cd E:/ "start in E:/

""""""""""""""""""""""""""""""""""
"       Option Settings          "
""""""""""""""""""""""""""""""""""
set grepprg=egrep\ -nHi

""""""""""""""""""""""""""""""""""
"           Mappings             "
""""""""""""""""""""""""""""""""""
let mapleader="," "use , instead of \ in mappings with <leader>
"<F2> to toggle the tag list window
noremap <silent> <F2> :TlistToggle <Enter>
"<leader>f to start the Find command
nnoremap <leader>f :F 
"<leader>l to jump to a line in a VB program
nnoremap <silent> <leader>l :VBLine 
"jump to the next VB6 function or sub declaration
nnoremap <silent> gs :call search('\(public\\|private\) \(sub\\|function\) \zs','')<Enter>
nnoremap <silent> gS :call search('\(public\\|private\) \(sub\\|function\) \zs','b')<Enter>
vnoremap <silent> gs :call search('\(public\\|private\) \(sub\\|function\) \zs','')<Enter>
vnoremap <silent> gS :call search('\(public\\|private\) \(sub\\|function\) \zs','b')<Enter>

""""""""""""""""""""""""""""""""
"     Settings for java        "
""""""""""""""""""""""""""""""""
"Javaweb build and running javaweb tomcat server
autocmd Filetype java nnoremap <buffer> <F7> :make -s "zbuild.xml" publish<CR>
autocmd Filetype java nnoremap <buffer> <C-F7> :!start cmd /c "tomcatgo" & pause<CR>
""""""""""""""""""""""""""""""""""
"          Functions             "
""""""""""""""""""""""""""""""""""

" Find file with search everything and edit it.
function! Find(name)
  let l:list=split(system("es ".a:name),"\n")
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

function! BuildBugsCleanUp()
  execute "sort i"
  let line = 1
  let lastline = line("$")
  let matchpat = "^.\\+\\(\\s\\+(\\d\\+)$\\)\\@="
  while line < lastline
    let compthis = matchstr(getline(line),matchpat)
    let compthat = matchstr(getline(line + 1),matchpat)
    if (compthis == compthat)
      let linetext = getline(line)
      call setline(line,"\t* " . linetext)
      echo compthis
      echo compthat
    endif
    let line = line + 1
  endwhile
endfunction

function! VbLine(lineNo)
  call search('Option Explicit', 'w')
  let l:newLine = line('.') + a:lineNo - 1
  echo l:newLine
  call cursor(l:newLine, 0)
endfunction
command! -nargs=1 VBLine :call VbLine("<args>")

function! GetStrutsStackItem(fname, strutsItem)
  let l:StrutsPaths = {"form": ["E:\\JavaWeb\\src\\com\\logisys911\\web\\struts\\actionforms\\"],
        \              "action": ["E:\\JavaWeb\\src\\com\\logisys911\\web\\struts\\action\\"],
        \              "bean": ["E:\\JavaWeb\\src\\com\\logisys911\\web\\struts\\action\\"],
        \              "jsp": ["E:\\JavaWeb\\WebContent\\jsp\\", "E:\\JavaWeb\\WebContent\\jsp\\forms\\", "E:\\JavaWeb\\WebContent\\jsp\\common\\"],
        \              "js": ["E:\\JavaWeb\\WebContent\\script\\"]}
  let l:StrutsSuffixes = {"form": "form.java",
        \              "action": "action.java",
        \              "bean": "bean.java",
        \              "jsp": ".jsp",
        \              "js": ".js"}

  let l:stem = substitute(a:fname, "form\.\\|action\.\\|bean\.", ".", "")
  let l:stem = fnamemodify(l:stem, ":r")
  let l:pathList = l:StrutsPaths[a:strutsItem]
  for l:path in l:pathList
    let l:filename = l:path . l:stem . l:StrutsSuffixes[a:strutsItem]
    if filereadable(l:filename)
      return l:filename
    endif
  endfor
  return ""
endfunction

function! EditStrutsStackItem(fname, strutsItem)
  let l:filename = GetStrutsStackItem(a:fname, a:strutsItem)
  echo l:filename
  if strlen(l:filename)
    execute ":e " . l:filename
  else
    echo "Could not find file!"
  endif
endfunction


nnoremap <leader>jf :call EditStrutsStackItem(@%, "form") <CR>
nnoremap <leader>ja :call EditStrutsStackItem(@%, "action") <CR>
nnoremap <leader>jb :call EditStrutsStackItem(@%, "bean") <CR>
nnoremap <leader>jp :call EditStrutsStackItem(@%, "jsp") <CR>
nnoremap <leader>js :call EditStrutsStackItem(@%, "js") <CR>
