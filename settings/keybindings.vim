" Indent like VSCode
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Indent
nnoremap <Leader>t gg=G

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
map <C-p> :Rg<CR>

" COC
map <silent> gd <Plug>(coc-definition)
map <silent> gt <Plug>(coc-type-definition)
map <silent> gi <Plug>(coc-implementation)
map <silent> gr <Plug>(coc-references)

" Prettier
nnoremap <Leader>f :CocCommand prettier.formatFile<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
  \ "sy
  \ gvgr
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
