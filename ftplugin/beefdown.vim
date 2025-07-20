setlocal filetype=beefdown

function! BeefdownUpdateColorColumn()
  let current_line = line('.')
  let lines = getline(1, '$')
  let in_beef_block = 0
  
  for i in range(1, len(lines))
    let line = lines[i-1]
    if line =~ '```beef\.part'
      let in_beef_block = 1
    elseif line =~ '```' && in_beef_block
      let in_beef_block = 0
    endif
    
    if i == current_line
      break
    endif
  endfor
  
  if in_beef_block
    setlocal colorcolumn=6,12,18,24,30,36,42
  else
    setlocal colorcolumn=
  endif
endfunction

highlight ColorColumn ctermbg=white guibg=white ctermfg=233 guifg=233

augroup beefdown_colorcolumn
  autocmd!
  autocmd CursorMoved,CursorMovedI * call BeefdownUpdateColorColumn()
augroup END

call BeefdownUpdateColorColumn()

augroup beefdown_reset
  autocmd!
  autocmd FileType * if &ft != 'beefdown' | setlocal colorcolumn= | endif
augroup END
