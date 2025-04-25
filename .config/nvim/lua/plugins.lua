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
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'github/copilot.vim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'NeogitOrg/neogit',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'David-Kunz/jester'
  use "lewis6991/gitsigns.nvim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'hashivim/vim-terraform'
  use "jxnblk/vim-mdx-js"
  use "vague2k/vague.nvim"
end)
