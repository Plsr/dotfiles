
let mapleader = "," " Remap leader key to ','

" Key mappigns ----------
nnoremap \t :NERDTreeToggle<CR> " Map NERDTRee toggle to CRTL-N
nmap \o :set paste!<CR> " Toogle paste mode
nnoremap \g :Goyo<CR>
nmap <leader>v :tabedit $HOME/.vimrc<CR> " Open .vimrc on leader-v

" Turn off linewise keys
nmap j gj
nmap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

inoremap jk <esc>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>x :VimwikiToggleListItem<CR>

" Ultisnips config
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Vundle setup and Plugins ----------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree' " Filetree
Plugin 'Yggdroot/indentLine' " Visually display indentation level of lines
Plugin 'dracula/vim' " Color Scheme
Plugin 'pangloss/vim-javascript' " JS syntax support
Plugin 'mxw/vim-jsx' " JSX syntax support
Plugin 'itchyny/lightline.vim' " More aesthetic status bar
Plugin 'tpope/vim-surround' " Allow easy surrounding of words
Plugin 'airblade/vim-gitgutter' " Git gutter
Plugin 'tpope/vim-fugitive' " Git commands
Plugin 'tpope/vim-rails' " Rails helper
Plugin 'thoughtbot/vim-rspec' " Rspec test helpers
Plugin 'Valloric/YouCompleteMe' " Autocompletion
Plugin 'w0rp/ale' " Linitng Support
Plugin 'Plsr/vim-snippets' " Personal snippets
Plugin 'epilande/vim-es2015-snippets' " ES6 snippets
Plugin 'SirVer/ultisnips' " Ultisnips
Plugin 'junegunn/goyo.vim' " Writing prose
Plugin 'prettier/vim-prettier' " Code formatting
Plugin 'junegunn/fzf.vim' " fzf fuzzy finder
Plugin 'mileszs/ack.vim' " Run fzf from vim
Plugin 'ntpeters/vim-better-whitespace' " Display trailing whitespace

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Syntax Highlighting ----------
set encoding=utf8
syntax enable " Permanently enable syntax highlighting
colorscheme dracula " set color scheme

" Set background to transparent to macht terminal bg
hi Normal guibg=NONE ctermbg=NONE



" Editor Settings --------------------------------------------
language en_US
set tabstop=2 " show existing tab with 2 spaces width
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set expandtab " On pressing tab, insert 2 spaces
set number " Enbale line numbers
set relativenumber " Display relative line numbers
set cursorline " Hihglight line cursor resides in
set showcmd " show command in bottom bar
set showmatch " highlight matching [{()}]
set tw=80 " Set wrap length

" Below are some performance tweaks that are not needed if your terminal
" emulator is decent.
set ttyfast " Faster rendering
set lazyredraw " Faster rendering
set re=1 " User older verion of regex engine, should improve speed


" NERDTree Configuration -------------------------------------

" Automatically close NERDTree if it is the last remaining buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd VimEnter * wincmd p " Jump to the main window.


" Search ----------
set hlsearch
set incsearch " Highlight while typing
set ignorecase " Ignore the casing of the expression, for combination with next
set smartcase " Only ignore case if no upper case present
nnoremap \h :noh<CR> " Clear search highlighting on pressing space


" Fuzzy Finder ---------------------------------------------------
nnoremap <C-b> :Buffers<CR>
nmap <C-p> :Files<CR>
nmap <Leader>r :Tags<CR>

" Use The Silver Searcher for ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Use The Silver Searcher for fzf


" Splits ---------------------------------------------------------

" New splits start to the right an bottom
set splitbelow
set splitright

" Make navigating between splits easier, just use ctrl-l instead of ctrl-w l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" vimrc ----------

" Source the vimrc file after saving it
if has("autocmd")
  augroup AutoSource
    autocmd bufwritepost .vimrc nested source $MYVIMRC
  augroup END
endif


" Unorganised ----------
set noshowmode
set backspace=indent,eol,start
set laststatus=2
set rtp+=/usr/local/opt/fzf " fzf (fuzzy finder)
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
