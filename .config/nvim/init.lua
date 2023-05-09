require('plugins')

-- Configure leader key
vim.g.mapleader = ' '

-- Relative line numbers
vim.o.relativenumber = true

-- Tab configoruation (2 spaces)
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- netwr config
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 -- Use tree style listing

-- Remaps
vim.api.nvim_set_keymap('n', '<Leader>ft', ':Vex<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sc', ':source ~/.config/nvim/init.lua<CR>', { noremap = true })

vim.cmd [[ colorscheme zenbones ]]
vim.o.termguicolors = true
