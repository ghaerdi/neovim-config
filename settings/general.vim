set number relativenumber
set clipboard+=unnamedplus

set laststatus=0
set nowrap
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set splitbelow
set splitright
set autochdir
" set formatoptions=cro

" Disable foldcolumn
set nofoldenable

" Indent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2

" Convert tab to spaces
set expandtab
set smarttab

" Hide buffers
set hidden

" Hide dif between tabs and spaces
set nolist

" Dont make backups
set nobackup
set nowritebackup

syntax enable
filetype on
filetype indent on
filetype plugin on

let g:rust_recommended_style = 0
