local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- automatically install new packages that were added when this files is saved
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'bluz71/vim-nightfly-guicolors'
  use 'christoomey/vim-tmux-navigator'
  use 'szw/vim-maximizer'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { 'nvim-telescope/telescope.nvim', branch = "0.1.x" }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  use { 'neoclide/coc.nvim', branch = 'release' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
