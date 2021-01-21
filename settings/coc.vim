let g:coc_global_extensions = [
\   'coc-tsserver',
\   'coc-deno',
\   'coc-json',
\   'coc-emmet',
\   'coc-css',
\   'coc-prettier',
\   'coc-go',
\   'coc-ultisnips',
\   'coc-highlight',
\   'coc-omnisharp',
\ ]

autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-
