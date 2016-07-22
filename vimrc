set nocompatible

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Common
Plug 'tpope/vim-sensible'

" JavaScript & NodeJS
Plug 'othree/yajs.vim'

" UI
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'

call plug#end()

" Let's tune VIM
colorscheme molokai

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

set list lcs=trail:·,tab:»·

set laststatus=2
set incsearch " Incremental search
set hlsearch

set number
set relativenumber
set cursorline

set colorcolumn=80

set wildmenu wildmode=longest:full,full

set mouse=a

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

