let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['python', 'javascript'],
                           \ 'passive_filetypes': [] }

hi SpellBad guisp=red
hi SpellCap guisp=orangered

"javascript-jsl: use custom jsl.conf file
let g:syntastic_javascript_jsl_conf = '-conf "' . $HOME . '/.vim/bundle/plugin-settings/plugin/jsl.conf"'

