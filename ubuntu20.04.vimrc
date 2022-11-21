packloadall          " Load all plugins
silent! helptags ALL " Load help files for all plugins.


syntax on
filetype plugin indent on
" tab related
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

colorscheme desert

" Manage plugins with vim-plug.
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
let g:plug_timeout = 300  " Increase vim-plug timeout  for YouCompleteMe.
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py'  }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'julesdesmit/aleo.vim'
Plug 'rust-lang/rust.vim'


call plug#end()
