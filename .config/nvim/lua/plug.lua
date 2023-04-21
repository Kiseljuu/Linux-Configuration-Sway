-- Packer
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

-- Packer Plugins
return require('packer').startup(function(use)

-- Packer
use 'wbthomason/packer.nvim'
-- Treesitter
use 
{
 'nvim-treesitter/nvim-treesitter',
 run = function()
 local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
 ts_update()
 end,
}
-- Dracula Theme
use 'Mofiqul/dracula.nvim'
-- Lualine
use 
{
 'nvim-lualine/lualine.nvim',
 requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}  
-- Indentation
use "lukas-reineke/indent-blankline.nvim"
-- Mason
use
{
 'williamboman/mason.nvim',    
 'williamboman/mason-lspconfig.nvim'
}
-- LSP     
use 'neovim/nvim-lspconfig' 
use 'simrat39/rust-tools.nvim'
-- LSP Completion Framework
use 'hrsh7th/nvim-cmp' 
-- LSP Completion Source
use 'hrsh7th/cmp-nvim-lsp'
-- Useful completion sources:
use 'hrsh7th/cmp-path'                              
use 'hrsh7th/cmp-vsnip'                             
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/cmp-buffer'                            
use 'hrsh7th/cmp-nvim-lua'
use 'hrsh7th/cmp-nvim-lsp-signature-help'
-- Terminal
use 'voldikss/vim-floaterm'
-- Impatient (Fast Startup)
use 'lewis6991/impatient.nvim'


if packer_bootstrap then
 require('packer').sync()
 end
end)
