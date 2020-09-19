
" open .vimrc
noremap <silent> <leader>ev :e $MYVIMRC<CR>
" open .vim/
noremap <silent> <leader>eV :execute "e " . g:VIM_HOME<CR>
" open ftplugin
noremap <silent> <leader>ef :execute "e " . g:VIM_HOME . "ftplugin/" . &filetype . ".vim"<CR>
" source vimrc
noremap <silent> <leader>sv :so $MYVIMRC<CR>

" save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :x<cr>

nnoremap <tab> <c-^>

" yank to end
nnoremap Y y$

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" ack word
nnoremap gR :Ack '<C-R><C-W>' --ignore-dir={node_modules,build}<CR>
" ack word with current file extension
nnoremap gr :Ack '<C-R><C-W>' --ignore-dir={node_modules,build} --%:e<CR>
" ack WORD
nnoremap gO :Ack '<C-R><C-A>' --ignore-dir={node_modules,build}<CR>
" ack WORD with current file extension
nnoremap go :Ack '<C-R><C-A>' --ignore-dir={node_modules,build} --%:e<CR>

nnoremap Q <nop> " no ex mode

" remap j/k to add relative jumts to jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

"
" arrows to navigate in windows
nnoremap <silent> <up> <c-w>k
nnoremap <silent> <down> <c-w>j
nnoremap <silent> <right> <c-w>l
nnoremap <silent> <left> <c-w>h

" Smart way to move between windows
nnoremap <C-j> <C-W>w
nnoremap <C-k> <C-W>W

" undo tree
nnoremap <leader>u :MundoToggle<CR>
let g:mundo_preview_bottom = 1
