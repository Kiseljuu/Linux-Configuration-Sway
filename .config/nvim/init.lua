-----------
-- VonOS --
---------------------------
 -- Neovim Configuration --
 --------------------------



-- Faster Loading
require('impatient')

-- Leader Key
vim.g.mapleader = " " 

-- Imports
require('opts') 
require('keys')
require('plug')

-- Color Theme
vim.cmd("colorscheme dracula")


--------------------------
-- Plugin Configuration --
--------------------------

-- Treesitter
require('nvim-treesitter.configs').setup {
 ensure_installed = { "lua", "c", "css", "rust", "toml" },
 auto_install = true,
 highlight = {
  enable = true,
  additional_vim_regex_highlighting = false,
 },
 ident = { enable = true }, 
 rainbow = {
  enable = true,
  extended_mode = true,
  max_file_lines = nil,
 }
}

-- Dracula Theme
require('dracula').setup({
 colors = {
  bg = "#282A36",
  fg = "#F8F8F2",
  red = "#FF5555",
  cyan = "#8BE9FD",
  pink = "#FF79C6",
  menu = "#21222C",
  green = "#50fa7b",
  visual = "#3E4452",
  yellow = "#F1FA8C",
  orange = "#FFB86C",
  purple = "#BD93F9",
  nontext = "#3B4048",
  comment = "#6272A4",
  gutter_fg = "#4B5263",
  selection = "#44475A",
  bright_red = "#FF6E6E",
  bright_cyan = "#A4FFFF",
  bright_blue = "#D6ACFF",
  bright_green = "#69FF94",
  bright_white = "#FFFFFF",
  bright_yellow = "#FFFFA5",
  bright_magenta = "#FF92DF"
 },
 transparent_bg = true,
 italic_comment = true,
 show_end_of_buffer = true
})

-- Lualine
require('lualine').setup ({
 options = {
  icons_enabled = true,
  theme = 'dracula-nvim',
  section_separators = '',
  component_separators = '',
 sections = {
   lualine_a = {'mode'},
   lualine_c = {'filename'},
   lualine_y = {'progress'},
   lualine_z = {'location'},
   lualine_x = {'fileformat', 'filetype'}
  },
 },
})

-- Indentation
require("indent_blankline").setup {
 show_end_of_line = true
}

-- Mason
require("mason").setup({
 ui = {
  icons = {
   package_pending = "",
   package_installed = "",
   package_uninstalled = "",
  },
 }
})
require("mason-lspconfig").setup()

-- LSP     
local rt = require("rust-tools")
rt.setup({
 server = {
  on_attach = function(_, bufnr)
  -- Hover actions
  vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
  -- Code action groups
  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
  end,
 },
})

-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
 snippet = {
  expand = function(args)
  vim.fn["vsnip#anonymous"](args.body)
  end,
 },
 mapping = {
  ['<Tab>'] = cmp.mapping.select_next_item(),
  ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
  ['<C-e>'] = cmp.mapping.close(),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<CR>'] = cmp.mapping.confirm({
  behavior = cmp.ConfirmBehavior.Insert,
  select = true,
  })
 },
 sources = {
  { name = 'calc'},                               -- Math Calculation
  { name = 'path' },                              -- File Paths
  { name = 'nvim_lsp_signature_help'},            -- Display Function Signatures with Current Parameter Emphasized
  { name = 'vsnip', keyword_length = 2 },         -- Nvim-cmp Source for Vim-vsnip 
  { name = 'buffer', keyword_length = 2 },        -- Source Current Buffer
  { name = 'nvim_lua', keyword_length = 2},       -- Complete Neovim's Lua Runtime API: vim.lsp.*
  { name = 'nvim_lsp', keyword_length = 3 },      -- Language Server
 },
 window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
 },
 formatting = {
  fields = {'menu', 'abbr', 'kind'},
  format = function(entry, item)
  local menu_icon = {
   nvim_lsp = 'λ',
   vsnip = '⋗',
   buffer = 'Ω',
   path = '🖫',
  }
  item.menu = menu_icon[entry.source.name]
  return item
  end,
 },
})
