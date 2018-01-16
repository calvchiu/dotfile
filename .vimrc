set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'Townk/vim-autoclose'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'artur-shaik/vim-javacomplete2'

call plug#end()

set rtp+=~/.fzf

"visual and format
set t_Co=256

try
  "colorscheme hybrid
  colorscheme molokai
  "colorscheme solarized
catch
endtry

syntax on
set background=dark
set encoding=utf-8
set guifont=Inconsolata\ for\ Powerline:h12
set incsearch
set mouse=a
set laststatus=2
set number
set relativenumber
set shiftwidth=2
set tabstop=2
set smartindent
set expandtab
set ignorecase
set smartcase
set autoindent
set scrolloff=3
set bs=indent,eol,start
set history=1000
set undolevels=1000
set showcmd
set showmatch
set path=.,,**
set breakindent
set showbreak=¬
set hidden
set autoread
set clipboard=unnamedplus
set nowrap
set foldenable
set foldmethod=indent
set foldlevel=1


"syntax
autocmd BufNewFile,BufReadPost *.ru set filetype=ruby

"prose writing
autocmd BufNewFile,BufRead *.md setlocal textwidth=80
autocmd BufNewFile,BufRead *.md setlocal spell

"leader mapping
let mapleader = "\<Space>"
"[optional] customize timeout(in milliseconds) for mapped keysequences
"set timeoutlen=500
nnoremap <leader><leader> :nohlsearch<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
"nnoremap <leader>w :w<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>J :%!python -m json.tool<CR>
map <leader>/ <Plug>(easymotion-prefix)
map <leader>w <Plug>(easymotion-w)
map <leader>b <Plug>(easymotion-b)


"butter fingers
command W w
command Q q
command Wq wq
command WQ wq

"buffer management
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
"nnoremap <leader>b :ls<CR>

"ctags
"set autochdir
set tags=tags;,./tags

"vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"fzf.vim
"let g:fzf_layout = { 'right': '~40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

if executable('fzf')
  "let $FZF_DEFAULT_COMMAND = 'ag -l -g --ignore=tags ""'
  nnoremap <c-p> :FZF -m<cr>
  nnoremap <leader>p :Buffers<cr>
  nnoremap <leader>/ :Ag<cr>
  let g:fzf_layout = { 'down': '40%' }
    "fzf buggy with tmux
    "let g:fzf_layout = {}
  let g:fzf_buffers_jump = 1
end

"goyo
function! s:goyo_enter()
  set nonumber
  set norelativenumber
endfunction

function! s:goyo_leave()
  set number
  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
let g:goyo_width = 85

"gitgutter
"let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

"tagbar
nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }


"netrw
let g:netrw_liststyle=3

"syntatic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslneFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntatis_check_on_wq = 0

"airline
let g:airline_mode_map = {
	\ '__' : '-',
	\ 'n' : 'N',
	\ 'i' : 'I',
	\ 'R' : 'R',
	\ 'c' : 'C',
	\ 'v' : 'V',
	\ 'V' : 'V',
	\ 'x' : 'V',
	\ 's' : 'S',
	\ 'S' : 'S',
	\ 'X' : 'S',
	\ }
"let g:airline_theme='bubblegum'
let g:airline_theme='laederon'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep='|'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''
"let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts=0

"tmuxline
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0
let g:tmuxline_theme = 'airline_visual'
"      \'c'    : '#H',
"      \'a'    : '#S',
"      \'b'    : '#W',
let g:tmuxline_preset = {
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}

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
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

"exit insert mode
inoremap jj <esc>
inoremap jk <esc>

"find files with wildmenu
"set path=$PWD/**
set wildmenu
set wildmode=list:longest,full"

"[optional] reduce vim commands by two keystrokes
"nnoremap ; :

"define split behavior
set splitbelow
set splitright

"clear search highlights with ,/
nmap <silent> ,/ :nohlsearch<CR>

"Auto indent for function {}
inoremap {<CR> {<CR>}<C-o>O

"[optional]display indentation and eol
"set list
"set listchars=tab:▸\ ,eol:¬

"removes trailing whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e


" Open cursor at last position
if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\   exe "normal g'\"" |
				\ endif
endif

"[Alternative] Open cursors at last position
"Although the main purpose is to load the folds
"of the document
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"osx - change cursor depending on model
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif" "

if executable('ag')
  " Note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif"
