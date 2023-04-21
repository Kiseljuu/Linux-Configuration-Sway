-- Options
local o = vim.o
local opt = vim.opt 
local set = vim.opt
local cmd = vim.api.nvim_command

-- Relative Numbers
opt.number = true
vim.cmd([[
set relativenumber
]])

-- Idk
opt.wildignore = {'*/cache/*', '*/tmp/*'}
opt.completeopt = {'menuone', 'noselect', 'noinsert'}

-- Theme
opt.syntax = "ON"
opt.cursorline = true
opt.cursorline = true
opt.termguicolors = true

-- Search
opt.hlsearch = false 
opt.smartcase = true 
opt.incsearch = true 
opt.ignorecase = true 

-- Whitespaces
opt.tabstop = 2 
opt.shiftwidth = 2 
opt.softtabstop = 2 
opt.expandtab = true 

-- LSP Diagnostics Options
local sign = function(opts)
 vim.fn.sign_define(opts.name, {
  texthl = opts.name,
  text = opts.text,
  numhl = ''
})
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
 virtual_text = false,
 signs = true,
 update_in_insert = true,
 underline = true,
 severity_sort = false,
 float = {
  border = 'rounded',
  source = 'always',
  header = '',
  prefix = '',
 },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
