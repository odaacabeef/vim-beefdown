runtime! syntax/markdown.vim

syntax region beefPartCodeBlock start="```beef\.part" end="```" contains=@markdown
highlight link beefPartCodeBlock markdownCodeBlock 