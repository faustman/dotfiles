set nocompatible
set encoding=utf8

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Common
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug '/usr/bin/fzf' | Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" JavaScript & NodeJS
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'

" Frontend related
"
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" Go
Plug 'fatih/vim-go'

" UI
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'

call plug#end()

" Let's tune VIM
set t_Co=256

colorscheme molokai

" show existing tab with 4 spaces width
set tabstop=2
" " when indenting with '>', use 4 spaces width
set shiftwidth=2
" " On pressing tab, insert 4 spaces
set expandtab

set list lcs=trail:·,tab:»·

set laststatus=2
set incsearch " Incremental search
set hlsearch

set number
set relativenumber
set cursorline

" No noise
set noswapfile
set nobackup
set nowritebackup

set colorcolumn=80

set wildmenu wildmode=longest:full,full

set mouse=a

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Cursor style in diferent modes
"

" let &t_EI = "\<Esc>[1 q"
" let &t_SR = "\<Esc>[3 q"
" let &t_SI = "\<Esc>[5 q"


" Lightline custom
"
" Font: https://github.com/ryanoasis/nerd-fonts
" Separators: https://github.com/ryanoasis/powerline-extra-symbols#glyphs
"
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0 ".branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Emmet config
"
autocmd FileType html,css,vue EmmetInstall
