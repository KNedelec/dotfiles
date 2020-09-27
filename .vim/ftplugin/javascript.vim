" override in ../after/ftplugin
"

" redux projections mappings
" edit redux actions
nnoremap <leader>era :Eactions<cr>
" edit redux selectors
nnoremap <leader>ers :Eselectors<cr>
" edit redux reducer
nnoremap <leader>err :Ereducer<cr>
" edit redux state
nnoremap <leader>ert :Estate<cr>

" edit standard files
nnoremap <leader>esa :e ./src/app.js<cr>
nnoremap <leader>esi :e ./src/index.js<cr>
