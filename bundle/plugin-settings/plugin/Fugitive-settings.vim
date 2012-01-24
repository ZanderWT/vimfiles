"delete cvs and fugitive diff buffers on close
"""""""""""""""""""""""""""""""""""""""""""""""
"    Plugin Configurations for Fugitiv        "
"""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufReadPost fugitive://* set bufhidden=delete
