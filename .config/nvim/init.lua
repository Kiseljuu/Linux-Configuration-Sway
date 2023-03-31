------------------------
-- Nvim Configuration --
------------------------

-- Options
local set = vim.opt

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.showmode = false 

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.hlsearch = true                
vim.opt.incsearch = true              
vim.opt.smartcase = true 
vim.opt.ignorecase = true
vim.opt.cursorline = true
vim.opt.cursorline = true
vim.opt.smartindent = true 
vim.opt.termguicolors = true
vim.opt.wildignore = {'*/cache/*', '*/tmp/*'}

vim.cmd[[colorscheme dracula]]

-- Keybindings
local map = vim.api.nvim_set_keymap
local opt = 
{
 noremap = true,
 silent = true
}

map("n", "<C-k>", "10k", opt)
map("n", "<C-j>", "10j", opt)
map("n", "<leader>s", ":x!<CR>", opt)
map("n", "<leader>q", ":q!<CR>", opt)
map("n", "<leader>u", ":PackerUpdate<CR>", opt)
map("n", "<leader>t", ":TSUpdate<CR>", opt)



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
  require('nvim-treesitter.configs').setup ({
  highlight = {
   enable = true,
  },
  ensure_installed = {
   'rust',
   'c',
   'lua',
   'css'
  },
  })

  -- Dracula Theme
  use 'Mofiqul/dracula.nvim'
  local dracula = require("dracula")
  dracula.setup ({
  colors = {
   bg = "#282A36",
   fg = "#F8F8F2",
   selection = "#44475A",
   comment = "#6272A4",
   red = "#FF5555",
   orange = "#FFB86C",
   yellow = "#F1FA8C",
   green = "#50fa7b",
   purple = "#BD93F9",
   cyan = "#8BE9FD",
   pink = "#FF79C6",
   bright_red = "#FF6E6E",
   bright_green = "#69FF94",
   bright_yellow = "#FFFFA5",
   bright_blue = "#D6ACFF",
   bright_magenta = "#FF92DF",
   bright_cyan = "#A4FFFF",
   bright_white = "#FFFFFF",
   menu = "#21222C",
   visual = "#3E4452",
   gutter_fg = "#4B5263",
   nontext = "#3B4048"
  },
  transparent_bg = true,
  italic_comment = true,
  show_end_of_buffer = true
  })

  -- Lualine
  use 
  {
   'nvim-lualine/lualine.nvim',
   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }  
  require('lualine').setup ({
    options = {
     theme = 'dracula-nvim',
     icons_enabled = true,
     component_separators = '|',
     section_separators = '',
    sections = {
      lualine_a = {'mode'},
      lualine_c = {'filename'},
      lualine_x = {'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
     },
    },
  })

  -- Indentation
  use "lukas-reineke/indent-blankline.nvim"
  require("indent_blankline").setup {
   show_end_of_line = true
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
