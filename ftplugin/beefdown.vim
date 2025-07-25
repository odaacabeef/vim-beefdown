setlocal filetype=beefdown

setlocal colorcolumn=6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,216,222,228,234,240,246,252,258,264,270,276,282,288,294,300

highlight ColorColumn ctermbg=233 guibg=233 ctermfg=white guifg=white gui=nocombine cterm=nocombine

augroup beefdown_reset
  autocmd!
  autocmd FileType * if &ft != 'beefdown' | setlocal colorcolumn= | endif
augroup END
