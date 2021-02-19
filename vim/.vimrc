" jorp's vimrc

" indenting is 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" line numbers
set number

" copy indent from prev line
set autoindent

" tries its hardest to do the right thing
set smartindent

" edge-case, most likely a no-op
set nocompatible

" don't use actual tab character
set expandtab

" show current position at bottom
set ruler

" highlight current line
set cursorline

" syntax highlighting
syntax on

" highlighted search
set hlsearch

filetype off

" vim-plug
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go'
call plug#end()
filetype plugin indent on
map <C-o> :NERDTreeToggle<CR>

" tell vim what background color looks like
set background=dark
" tell vim what colorscheme to use
colorscheme gruvbox
