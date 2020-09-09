" NEOVIM CONFIG

" ---------- General ----------
set encoding=utf8

" Enable syntax highlighing
syntax on

" Set tabs to have 2 spaces
set tabstop=2
set softtabstop=2

" Indent when moving to the next line while writing code
set autoindent

" Expand tabs into spaces
set expandtab

" Enable line numbers
set number


" When using the >> or << commands, shift lines by 2 spaces
set shiftwidth=2

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

" Remap leader key to space
let mapleader = " "
nnoremap <SPACE> <Nop>

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
Plug 'jeffkreeftmeijer/vim-dim'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'

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

" File Tree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Show marks in gutter
Plug 'kshenoy/vim-signature'

" Initialize plugin system
call plug#end()

" ---------- Color Scheme ----------
colorscheme dim

" ---------- fzf & silversearcher ----------
" Use The Silver Searcher for fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""' 

" fzf (fuzzy finder)
set rtp+=/usr/local/opt/fzf 

" ---------- Code formatting ----------
" Use prettier for js and css files
let g:ale_fixers = {
\   'typescript': ['prettier'],
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
nnoremap , za

" Shut off completion messages
set shortmess+=c

" NERDTree Configuration -------------------------------------

" Automatically close NERDTree if it is the last remaining buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd VimEnter * wincmd p " Jump to the main window.

set ttyfast " u got a fast terminal

" ------------ coc.nvim ----------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Jump to definition
nmap <leader>gd  <Plug>(coc-definition)
" Show references
nmap <leader>gr  <Plug>(coc-references)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Override ptyton filetype plugin causing faulty indentation
" See https://vi.stackexchange.com/questions/8382/vim-doesnt-use-the-correct-indentation-in-python-files
filetype plugin on
autocmd FileType python setlocal noexpandtab shiftwidth=2 softtabstop=2
