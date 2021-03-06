if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " UI
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yggdroot/indentLine'
    Plug 'dracula/vim'
    Plug 'wadackel/vim-dogrun'

    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Autocomplet
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'kiteco/vim-plugin'

    " Linter
    Plug 'dense-analysis/ale'

    " Comment code
    Plug 'tpope/vim-commentary'

    " Autosave
    Plug '907th/vim-auto-save'

    " Show Diff
    Plug 'airblade/vim-gitgutter'

call plug#end()
