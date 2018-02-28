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

"Crtl-P
Plugin 'ctrlpvim/ctrlp.vim'

" Emmet
Plugin 'mattn/emmet-vim'

" Color Schemes
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'romainl/Apprentice'


" JS Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

"Mardown support
Plugin 'plasticboy/vim-markdown'

Plugin 'tpope/vim-surround' 

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Rails
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'

" Notes & Orga
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Syntax Highlighting -----------------------------------------

set encoding=utf8
let g:airline_powerline_fonts = 1
set guifont=Fira\ Mono\ for\ Powerline:h16

" Permanently enable syntax highlighting
syntax on


" Color Scheme
colorscheme apprentice
set background=dark

set hlsearch

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
set showmatch  " highlight matching [{()}]
" Set new symbols for whitespace and eol
set listchars=tab:▸\ ,eol:¬
" Enable display of whitespace and eol characters by default
set list
"Invisible character colors 
hi NonText ctermfg=247
hi SpecialKey ctermfg=247

" Change line height (only works for gvim)
set linespace=8

" Set wrap length
set tw=80

" Remove scrollbars from MacVim
set guioptions=

" Faster rendering
set ttyfast
set lazyredraw

" User older verion of regex engine, should improve speed
set re=1

set foldenable " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <c-y> za       " space open/closes folds
set foldmethod=indent   " fold based on indent level

" NERDTree Configuration -------------------------------------

" Automatically close NERDTree if it is the last remaining buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autmoatically start NERDTree on launch
autocmd vimenter * NERDTree

" Jump to the main window.
autocmd VimEnter * wincmd p

" Syntastic needs the eslint executable in the path
if $PATH !~ "\eslint"
    let $PATH="/Users/chrispop/.nvm/versions/node/v8.4.0/bin/eslint" . $PATH
endif

" CTRL-P Configuration ----------------------------------------

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' " ignore certain directories

" Custom keymaps -----------------------------------------------

" Set , to leader
let mapleader = ","

" Remap Ctrl-L to trigger esc
:imap <C-L> <Esc>

" Clear search highlighting on pressing space
nnoremap <Space> :noh<CR>

" Source the vimrc file after saving it
if has("autocmd")
  augroup AutoSource
    autocmd bufwritepost .vimrc nested source $MYVIMRC
  augroup END
endif

" Open .vimrc on leader-v
nmap <leader>v :tabedit $MYVIMRC<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
