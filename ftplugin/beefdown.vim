setlocal filetype=beefdown
setlocal colorcolumn=6,12,18,24,30,36,42
highlight ColorColumn ctermbg=white guibg=white ctermfg=233 guifg=233

augroup beefdown_reset
  autocmd!
  autocmd FileType * if &ft != 'beefdown' | setlocal colorcolumn= | endif
augroup END
