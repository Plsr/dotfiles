" Vundle Setup ----------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Show indention levels
Plugin 'Yggdroot/indentLine'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Vim Ariline
Plugin 'vim-airline/vim-airline'

" Command-T
Plugin 'wincent/command-t'

" JSX Syntac Highlighting
Plugin 'mxw/vim-jsx'

" Gruvbox color scheme
Plugin 'morhetz/gruvbox'

" JS Syntax
Plugin 'pangloss/vim-javascript'

"Mardown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Syntax Highlighting -----------------------------------------

set encoding=utf8
let g:airline_powerline_fonts = 1
set guifont=Fira\ Mono\ for\ Powerline:h14

" Permanently enable syntax highlighting
syntax on

" Color Scheme
colorscheme gruvbox
set background=dark

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Editor Settings --------------------------------------------

" show existing tab with 2 spaces width
set tabstop=2
" " when indenting with '>', use 2 spaces width
set shiftwidth=2
" " On pressing tab, insert 2 spaces
set expandtab
" Enbale line numbers
set number
" Set new symbols for whitespace and eol
set listchars=tab:▸\ ,eol:¬
" Enable display of whitespace and eol characters by default
set list
"Invisible character colors 
hi NonText ctermfg=247
hi SpecialKey ctermfg=247

" Change line height (only works for gvim)
set linespace=4

" Set Gui Font
set guifont=Inconsolata\ for\ Powerline:h15

" AutoClose Brackets etc.
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O

" NERDTree Configuration -------------------------------------

" Automatically close NERDTree if it is the last remaining buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autmoatically start NERDTree on launch
autocmd vimenter * NERDTree

" Jump to the main window.
autocmd VimEnter * wincmd p
