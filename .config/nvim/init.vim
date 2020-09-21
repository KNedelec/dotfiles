
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" still use .vim/ instead of nvim .config/
let g:UltiSnipsSnippetDirectories=[g:VIM_HOME.'/UltiSnips']

