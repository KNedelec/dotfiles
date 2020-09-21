
" mark the last line of the import section
" find the last expression matching these
"
"import * from 'toto/tata'
"} from 'topto/tata'
"import { asd, asd } from 'teoto/tata'
"import 'asdasd/tata'
"
function! kn#js#mark_imports_section(mark)
  let l:curpos = getcurpos()
  let l:last_line = line('$')

  " go to last line and
  " search backward to have the first result is the last import
  call cursor(l:last_line, 0)
  let l:pattern = '\v^import \* from ''\S*''$|^import ''\S*''$|^\} from ''\S*''$|^import \{.*\} from ''\S*''$'

  " if no import, set first line
  let l:line = search(l:pattern, 'nb') + 1

  " if last import is last line of the file, set last line
  if l:line > l:last_line
    let l:line = l:last_line
  endif

  " set mark to line and go back
  call setpos("'" . a:mark, [0, l:line, 1, 0])
  call setpos(".", l:curpos)
endfunction
