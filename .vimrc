" Vundle Setup ----------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'

Plugin 'Yggdroot/indentLine'

" Vim Ariline
Plugin 'itchyny/lightline.vim'

"Crtl-P
Plugin 'ctrlpvim/ctrlp.vim'

" Emmet
Plugin 'mattn/emmet-vim'

" Color Schemes
Plugin 'dylanaraps/wal.vim'

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

" Linitng Support
Plugin 'w0rp/ale'

" Autocompletion
Plugin 'Shougo/deoplete.nvim'
Plugin 'carlitux/deoplete-ternjs' 


" JS/React helpers
Plugin 'epilande/vim-react-snippets'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Syntax Highlighting -----------------------------------------

set encoding=utf8
let g:airline_powerline_fonts = 1

" Permanently enable syntax highlighting
syntax on

" Setup terminal and tmux for syntax highlighting in terminal vim
set t_Co=256
if &term =~# '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" set color scheme
colorscheme wal

" Highlight search results
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

" Display relative line numbers
set relativenumber

set showmatch  " highlight matching [{()}]
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

" Jump to the main window.
autocmd VimEnter * wincmd p

" Map NERDTRee toggle to CRTL-N
map <C-n> :NERDTreeToggle<CR>

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

" Splits ---------------------------------------------------------

" New splits start to the right an bottom
set splitbelow
set splitright

" Make navigating between splits easier, just use ctrl-l instead
" of ctrl-w l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Source the vimrc file after saving it
if has("autocmd")
  augroup AutoSource
    autocmd bufwritepost .vimrc nested source $MYVIMRC
  augroup END
endif

" Open .vimrc on leader-v
nmap <leader>v :tabedit $HOME/.vimrc<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Start deoplete on vim startup
let g:deoplete#enable_at_startup = 1

" Enable smarter tabline for vim airline
let g:airline#extensions#tabline#enabled = 1

" Enable React snippets
let g:UltiSnipsExpandTrigger="<C-l>"

" Automatically change pwd to opened directory
set autochdir

" Set folder for vim notes
let g:notes_directories = ['~/Documents/Notes']
language en_US

set noshowmode

let g:lightline = {
  \ 'colorscheme': 'wal',
  \ }
