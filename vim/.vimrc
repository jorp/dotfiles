set tabstop=4
set shiftwidth=4
set number
set autoindent
set smartindent
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on
map <C-o> :NERDTreeToggle<CR>

set background=dark
colorscheme gruvbox
