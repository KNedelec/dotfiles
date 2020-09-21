"
" mark imports on BufEnter js like files with mark 'i'
autocmd! BufWinEnter *.js,*.ts,*.jsx,*.tsx call kn#js#mark_imports_section('i')
