" Manage themes

if exists('loaded_kn_themes')
  fini
endif
let loaded_kn_themes = 1

if !exists('g:colors_name') && exists('g:kn_themes') && len(g:kn_themes) > 0
  execute 'colorscheme ' . g:kn_themes[0]
endif

function! kn#themes#cycle_themes()
  if !exists('g:kn_themes') | len(g:kn_temes) == 0
    return
  endif

  let current = g:colors_name
  for i in range(0, len(g:kn_themes) - 1)
    if g:kn_themes[i] == current
      let new_theme = get(g:kn_themes, i+1, g:kn_themes[0])
      try
        execute 'colorscheme ' . new_theme
        echom 'Theme ' . new_theme
      catch
        " fallback on theme 1
        echom v:exception
        let new_theme = get(g:kn_themes, 0)
        execute 'colorscheme ' . new_theme
      endtry
    endif
  endfor
endfunction

command! KnCycleThemes call kn#themes#cycle_themes()
