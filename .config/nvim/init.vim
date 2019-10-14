" NEOVIM CONFIG

" ---------- General ----------
set encoding=utf8

" Enable syntax highlighing
syntax on

" Enable line numbers
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

" Hide current mode, airline takes care of this
set noshowmode

" ---------- Key bindings ----------

" Remap leader key to ','
let mapleader = ","

" Easier movement to beginning/end of line
nnoremap B ^
nnoremap E $

" Clear search highlighting
nnoremap \h :noh<CR>
nnoremap \g :Goyo<CR>

" Keybindings for fuzzy finders
nnoremap <C-b> :Buffers<CR>
nmap <C-p> :Files<CR>
nmap <Leader>r :Tags<CR>

" Open init.vim with <leader>v
nmap <leader>v :tabedit $HOME/.config/nvim/init.vim<CR>

" Toggle TagBar
nnoremap \t :TagbarToggle<CR>

" Toggle NERDTree
nnoremap \f :NERDTreeToggle<CR> 

" Make navigating between splits easier, just use ctrl-l instead of ctrl-w l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ---------- Plugins ----------
" Enable plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins below this
call plug#begin()

" Color scheme
Plug 'dylanaraps/wal.vim'

" Basic JS Syntax support
Plug 'pangloss/vim-javascript' 

" JSX syntax support
Plug 'mxw/vim-jsx' 

" More aesthetic status bar
Plug 'itchyny/lightline.vim' 

" fzf fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim' 

" Run fzf from vim
Plug 'mileszs/ack.vim' 

" Code formatting
Plug 'w0rp/ale'

" Display tags of a file in a buffe aside
Plug 'majutsushi/tagbar'

" Writing Prose
Plug 'junegunn/goyo.vim'

" Autocomplete
Plug 'lifepillar/vim-mucomplete'

" Vim wiki
Plug 'vimwiki/vimwiki'

" File Tree
Plug 'scrooloose/nerdtree'

" Rails helpers
Plug 'tpope/vim-rails'

" Show marks in gutter
Plug 'kshenoy/vim-signature'

" Initialize plugin system
call plug#end()


" ---------- Color Scheme ----------
colorscheme wal

" ---------- fzf & silversearcher ----------
" Use The Silver Searcher for fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""' 

" fzf (fuzzy finder)
set rtp+=/usr/local/opt/fzf 

" ---------- Code formatting ----------
" Use prettier for js and css files
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

" Autmatically fix files on save
let g:ale_fix_on_save = 1 

" Disable highlights
let g:ale_set_highlights = 0 

" -------- Folding ---------
" Fold by syntax
set foldmethod=syntax

" On opening a file, open all folds
set foldlevelstart=99

" Enable folding for JavaScript
let javaScript_fold=1

" Fold on space
nnoremap <space> za

" ---------- Autocompletion Settings ----------
set completeopt+=noselect

" Shut off completion messages
set shortmess+=c

" ---------- VimWiki ----------
let g:vimwiki_url_maxsave=0
let wiki = {}
let g:vimwikidir = $HOME . "/Dropbox (Personal)/vimwiki"
let wiki.path = g:vimwikidir
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let g:vimwiki_list=[wiki]
let g:vimwiki_folding='expr'

" NERDTree Configuration -------------------------------------

" Automatically close NERDTree if it is the last remaining buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd VimEnter * wincmd p " Jump to the main window.

