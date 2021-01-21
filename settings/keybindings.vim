" Tab like VSCode
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Buffer navigation
nnoremap <silent> <A-j> :bn<CR>
nnoremap <silent> <A-k> :bp<CR>

" Close current buffer
map <C-d> :bdelete<CR>

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Open fzf
map <C-f> :Files<CR>
map <C-b> :Buffers<CR>

" COC
map <silent> gd <Plug>(coc-definition)
map <silent> gy <Plug>(coc-type-definition)
map <silent> gi <Plug>(coc-implementation)
map <silent> gr <Plug>(coc-references)

" Prettier
vmap <S-f>  :CocCommand prettier.formatFile<CR>
nmap <S-f>  :CocCommand prettier.formatFile<CR>
