require('plugins')

-- disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- setup nvim-tree
require("nvim-tree").setup()

-- Configure leader key
vim.g.mapleader = ' '

-- Relative line numbers
vim.o.relativenumber = true
vim.o.number = true

-- Tab configoruation (2 spaces)
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Swapfiles
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

-- Remaps
vim.api.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeFindFileToggle<CR>', { noremap = true })

vim.opt.shell = '/opt/homebrew/bin/fish'
vim.cmd [[colorscheme vague]]
