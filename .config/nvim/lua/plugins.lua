vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use('nvim-treesitter/nvim-treesitter', { _run = ':TSUpdate' })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'github/copilot.vim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'tpope/vim-fugitive'
  use 'Mofiqul/vscode.nvim'
  use 'David-Kunz/jester'
  use "https://github.com/nocksock/do.nvim"
  use "lewis6991/gitsigns.nvim"
  use({ "rose-pine/neovim", as = "rose-pine" })
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'hashivim/vim-terraform'
  use 'ellisonleao/gruvbox.nvim'
  use 'sainnhe/everforest'
  use "folke/tokyonight.nvim"
  use "jxnblk/vim-mdx-js"
  use "jeffkreeftmeijer/vim-dim"
  use 'tjdevries/colorbuddy.vim'
  use "tjdevries/gruvbuddy.nvim"
  use "morhetz/gruvbox"
end)
