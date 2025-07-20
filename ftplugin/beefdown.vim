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
    setlocal colorcolumn=6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,234,240,246,252,258,264,270,276,282,288,294,300
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
  autocmd FileType * if &ft != 'beefdown' | setlocal colorcolumn= | call clearmatches() | autocmd! beefdown_colorcolumn | endif
augroup END
