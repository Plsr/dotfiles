vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'neoclide/coc.nvim', branch = 'release'}
  use "savq/melange-nvim"
  use('nvim-treesitter/nvim-treesitter', {_run = ':TSUpdate' })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'github/copilot.vim'
end)

