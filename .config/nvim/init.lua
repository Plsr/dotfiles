-- Basic settings
vim.o.number = true          -- Enable line numbers
vim.o.relativenumber = true  -- Use relative line numbers
vim.o.tabstop = 2 	         -- Number of spaces a tab represents
vim.o.shiftwidth = 2         -- Number of spaces for each indentation
vim.o.expandtab = true       -- Convert tabs to spaces
vim.o.smartindent = true     -- Automatically indent new lines
vim.o.wrap = true            -- Enable line wrapping
vim.o.linebreak = true       -- Wrap at word boundaries
vim.o.breakindent = true     -- Preserve indentation when wrapping
vim.o.cursorline = true      -- Highlight the current line
vim.o.termguicolors = true   -- Enable 24-bit RGB colors
vim.g.loaded_netrw = 1       -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw

-- Syntax highlighting and plugins
vim.cmd.syntax 'enable'
vim.cmd('filetype plugin indent on')

-- Leader key
vim.g.mapleader = ' ' -- Space as the leader key

-- Plugins
vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/savq/melange-nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/neoclide/coc.nvim',
    'https://github.com/fannheyward/telescope-coc.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/catppuccin/nvim'
})

-- Plugin config
local keyset = vim.keymap.set

-- Telescope
require('telescope').setup({
  extensions = {
    coc = {
      theme = "ivy",
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
      push_cursor_on_edit = true, -- save the cursor position to jump back in the future
      timeout = 3000, -- timeout for coc commands
    }
  }
})
require('telescope').load_extension('coc')

local telescope = require('telescope.builtin')
keyset('n', '<leader>ff', telescope.find_files)
keyset('n', '<leader>fg', telescope.live_grep)
keyset('n', '<leader>fb', telescope.buffers)
keyset('n', '<leader>fh', telescope.help_tags)
keyset('n', '<leader>fs', telescope.current_buffer_fuzzy_find)
keyset('n', '<leader>fc', telescope.git_bcommits)

-- Coc
keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keyset('n', 'gr', '<cmd>Telescope coc references<cr>', { silent = true })

-- Use K to show documentation in preview window
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- Code actions
keyset("x", "<leader>,", "<Plug>(coc-codeaction-selected)", { silent = true })
keyset("n", "<leader>,", "<Plug>(coc-codeaction-selected)", { silent = true })

-- nvimtree
require("nvim-tree").setup()
keyset("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { silent = true })

-- Color scheme
vim.cmd.colorscheme 'catppuccin'

