" Apparently, vim is not yet ready for Python 3.7
" This executes python once, silent, swallowing the error messages
" Should be removable in the future.
" Issue: https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

filetype plugin on

" Vundle Setup ----------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Filetree
Plugin 'scrooloose/nerdtree'

" Visually display indentation level of lines
Plugin 'Yggdroot/indentLine'

" Color Scheme
Plugin 'joshdick/onedark.vim'

" JS Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Airline
Plugin 'bling/vim-airline'

" Allow easy surrounding of words
Plugin 'tpope/vim-surround'

" Git
Plugin 'airblade/vim-gitgutter'

" Rails
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

" Linitng Support
Plugin 'w0rp/ale'

" JS/React helpers
Plugin 'epilande/vim-react-snippets'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'SirVer/ultisnips'

" Taking notes
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'vimwiki/vimwiki'

" Writing prose
Plugin 'junegunn/goyo.vim'

" Git
Plugin 'tpope/vim-fugitive'

" fzf (fuzzy finder)
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

" Display trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'

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
colorscheme onedark


" Highlight search results
set hlsearch

" Editor Settings --------------------------------------------

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

" Enbale line numbers
set number

" Display relative line numbers
set relativenumber

" highlight matching [{()}]
set showmatch  

" Set wrap length
set tw=80

" Faster rendering
set ttyfast
set lazyredraw

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" User older verion of regex engine, should improve speed
set re=1

set foldenable          " enable folding
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

" Custom keymaps -----------------------------------------------

" Set , to leader
let mapleader = ","

" Remap Ctrl-L to trigger esc
:imap <C-L> <Esc>

" Clear search highlighting on pressing space
nnoremap <Space> :noh<CR>

" Fuzzy Finder ---------------------------------------------------
nnoremap <C-b> :Buffers<CR>
nmap <C-p> :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>p :Ack! <space><CR>

" Use The Silver Searcher for ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Use The Silver Searcher for fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

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

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>x :VimwikiToggleListItem<CR>

" Enable React snippets
let g:UltiSnipsExpandTrigger="<C-l>"

language en_US

set noshowmode

set backspace=indent,eol,start

:let g:notes_directories = ['~//Dropbox (Personal)/notes']

" Set background to transparent to macht terminal bg
hi Normal guibg=NONE ctermbg=NONE

" Vimwiki Config
let g:vimwiki_url_maxsave=0
let wiki = {}
let g:vimwikidir = $HOME . "/Dropbox (Personal)/vimwiki"
let wiki.path = g:vimwikidir
let g:vimwiki_list=[wiki]
let g:vimwiki_folding='expr'

map <Leader>g :Goyo<CR>

