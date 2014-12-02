set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'

call vundle#end()            " required
filetype plugin indent on    " required

"visual and format
set t_Co=256
colorscheme hybrid
syntax on
set encoding=utf-8
set guifont=Inconsolata\ for\ Powerline:h12
set hlsearch
set incsearch
set mouse=a
set laststatus=2
set number
set shiftwidth=2
set smartindent
set autoindent
set scrolloff=5
set bs=indent,eol,start
set history=1000
set undolevels=1000

"CtrlP
let g:ctrlp_map = '<c-p>'
"netrw
let g:netrw_liststyle=3
"airline
let g:airline_powerline_fonts=1
"supertab
let g:SuperTabDefaultCompletionType="<c-n>"

"get better at vim
map <left>  <nop>
map <down>  <nop>
map <up>    <nop>
map <right> <nop>

"Remap cycle between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"more natural cursor movement
nnoremap j gj
nnoremap k gk

"reduce vim commands by two keystrokes
nnoremap ; :

"define split behavior
set splitbelow
set splitright

"clear search highlights with ,/
nmap <silent> ,/ :nohlsearch<CR>
