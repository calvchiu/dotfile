set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
"Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Townk/vim-autoclose'

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
set relativenumber
set shiftwidth=2
set tabstop=2
set smartindent
set autoindent
set scrolloff=5
set bs=indent,eol,start
set history=1000
set undolevels=1000
set showcmd
set showmatch
set path=.,,**
set cursorline

"syntax
autocmd BufNewFile,BufReadPost *.ru set filetype=ruby

"leader mapping
let mapleader = "\<Space>"
"[optional] customize timeout(in milliseconds) for mapped keysequences
"set timeoutlen=500
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>/ :nohlsearch<CR>

"butter fingers
command W w
command Q q
command Wq wq
command WQ wq

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode='ra'

"netrw
let g:netrw_liststyle=3

"airline
let g:airline_powerline_fonts=1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep='|'
let g:airline_left_sep=''

"supertab
let g:SuperTabDefaultCompletionType="<c-n>"

"nerdtree
"  switch between windows with <C-w>w
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2
"autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

"relative nu for normal mode movement
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"exit insert mode
inoremap jj <esc>

"[optional] reduce vim commands by two keystrokes
"nnoremap ; :

"define split behavior
set splitbelow
set splitright

"clear search highlights with ,/
nmap <silent> ,/ :nohlsearch<CR>

"Auto indent for function {}
inoremap {<CR> {<CR>}<C-o>O

"display indentation and eol
set list
set listchars=tab:▸\ ,eol:¬

"removes trailing whitespace on :w
autocmd BufWritePre * :s/\s\+$//e
