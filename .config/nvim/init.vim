" NEOVIM CONFIG

" ---------- General ----------



set encoding=utf8

" Enable syntax highlighing
syntax on

" Show line numbers
set relativenumber

" Redraw only when necessary
set lazyredraw

" Set tabs to have 2 spaces
set tabstop=2
set softtabstop=2

" Indent when moving to the next line while writing code
set autoindent

" Expand tabs into spaces
set expandtab


" When using the >> or << commands, shift lines by 2 spaces
set shiftwidth=2

" Show the matching part of the pair for [] {} and ()
set showmatch

" Show trailing whitespace
set listchars=trail:█

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Better searching
set ignorecase
set smartcase

" ---------- Key bindings ----------

" Remap leader key to ','
let mapleader = ","

" Easier movement to beginning/end of line
nnoremap B ^
nnoremap E $


" Open init.vim with <leader>v
nmap <leader>v :tabedit $HOME/.config/nvim/init.vim<CR>

" ---------- Plugins ----------
" Enable plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins below this
call plug#begin()

Plug 'sjl/badwolf'

" Initialize plugin system
call plug#end()


" ---------- Color Scheme ----------
colorscheme badwolf
