require('plugins')

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

-- netwr config
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 -- Use tree style listing

-- Remaps
vim.api.nvim_set_keymap('n', '<Leader>ft', ':Vex<CR>', { noremap = true })

vim.o.termguicolors = true
vim.cmd('colorscheme melange')

