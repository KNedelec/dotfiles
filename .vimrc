"
" VIM CONFIGURATION
"

set nocp hid ru nosol ai si fixeol et

let g:VIM_HOME = $HOME . '/.vim/'
let g:VIMRC = expand('<sfile>')

call plug#begin('~/.vim/plugged')
""
""
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Galooshi/vim-import-js'

""" lsp
Plug 'neovim/nvim-lspconfig'

"" git
Plug 'tpope/vim-fugitive'

""" improved netrw
Plug 'tpope/vim-vinegar'

"""" ctrlp
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

""""
Plug 'adelarsq/vim-matchit'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'
Plug 'michaeljsmith/vim-indent-object'

""" textobjs
Plug 'wellle/targets.vim'

""" misc
Plug 'terryma/vim-multiple-cursors'
Plug 'https://github.com/simnalamburt/vim-mundo'

""" search
Plug 'mileszs/ack.vim'

""" snips
Plug 'sirver/ultisnips'

" Theme
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

let g:kn_themes = ['gruvbox', 'nord', 'lucius', 'ayu', 'palenight']

set background=dark
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set tabstop=2
set expandtab
set backspace=indent,eol,start
set shiftwidth=2
set shiftround " always indent by multiple of shiftwidth
set showcmd " more inv
set t_Co=256
set showmatch
set wildmode=list:full
set wildmenu
set bs=2
set fo+=ctrq
set ls=2
set tw=80
set number " show currentline number
set relativenumber " user relativenumber, only usable if j/k are remapped to preserve the jumplist

set list " show spaces
set listchars-=eol:$
set listchars+=tab:>-
set listchars+=trail:·
set listchars+=nbsp:⦸ " U+29b8
set shm=at
set scrolloff=3
set sidescrolloff=5
syntax sync minlines=256 " scroll perf
set history=1000
set wildignore=*.swp,*.bak,plugins,*/app/cache/*,*/node_modules,*/dist/*,*/vendor,*/.venv
set title                " change the terminal's title
set noerrorbells         " don't beep
set nowb

set undolevels=1000
set undofile
set backupcopy=auto

" double slashes below means 'keeps file path' to distinguish 2 files with the same name but a different path
let &undodir=g:VIM_HOME . 'tmp/undo//' " undo files dir
set undodir+=/var/tmp/vim/undo//
let &directory=g:VIM_HOME . 'tmp/swp//' " swp files dir.
set directory+=/var/tmp/vim/swp//
let &backupdir=g:VIM_HOME . 'tmp/backup//' " backup files dir
set backupdir+=/var/tmp/vim/backup//
let &viewdir=g:VIM_HOME . 'tmp/views/' " sessions dir
set viewdir+=/var/tmp/vim/views/

set ttimeout
set ttimeoutlen=50
set colorcolumn=81
set completeopt=menuone
set shortmess+=c
set cursorline
set nojoinspaces

if has('folding')
  if has('windows')
    set fillchars=vert:┃ " continuous line between windows
  endif
endif

if has('linebreak')
  set linebreak       " don't go outside of the window. do not insert EOL
  set breakindent     " instead display a 'virtual' indented new line
  let &showbreak='↳'  " and show U+21b3 at the beginning"
  if exists('&breakindentopt')
    set breakindentopt=shift:2
  endif
endif

if exists('&belloff')
  set belloff=all
endif

if has('termguicolors')
  set termguicolors " use guifg/guibg instead of ctermfg/ctermbg in terminal
endif

if exists('+colorcolumn')
  let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif

set formatoptions-=t " remove auto wrap
set formatoptions+=n " smart indent inside numbered lists
if v:version > 703
  set formatoptions+=j "remove comment leader when joining lines
endif
set lazyredraw "don't bother updating screen during macro playback

syntax on
filetype plugin indent on

command! Red execute "redraw!"

" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

" Search
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set ignorecase
set smartcase
set magic


" switch paste mode
set pastetoggle=<F2>

" folding
set foldmethod=indent
set foldlevel=6

command! Smake execute "silent make | redraw!"

" use the silver searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ackprg = 'ag --vimgrep'
endif

set wildignore+=*.o,*.obj,*~
set wildignore+=*node_modules/**,*dist/**,*sass-cache*
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set tags=tags,.git/tags,./tags,../tags,../../tags

" ctrl-p
" let g:ctrlp_cmd = 'CtrlPMixed'
" reuse cache between sessions
let g:ctrlp_clear_cache_on_exit = 0
" search inside hidden files and folders
let g:ctrlp_show_hidden = 1
" number of files to scan, 0=no limit
let g:ctrlp_max_files = 0
" max folder depth
let g:ctrlp_max_depth = 25
let g:ctrlp_extensions = ['tag']
"let g:ctrlp_working_path_mode = '0'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_follow_symlinks = 1


autocmd FileType typescript :set makeprg=./node_modules/.bin/tsc\ --noEmit\ %

setglobal virtualedit=block

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" refresh ultisnips
:command! RU call UltiSnips#RefreshSnippets()

