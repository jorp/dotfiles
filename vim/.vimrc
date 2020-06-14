set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set number
set autoindent
set smartindent
map <C-o> :NERDTreeToggle<CR>
set background=dark
colorscheme gruvbox
