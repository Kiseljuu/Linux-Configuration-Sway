-- Functional Wrapper for Custom Keybindings
function map(mode, lhs, rhs, opts)
 local options = { noremap = true, silent = true }
 if opts then
  options = vim.tbl_extend("force", options, opts)
 end
 vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Quick Movement
map("n", "<S-k>", "10k")
map("n", "<S-j>", "10j")

-- Save and Exit
map("n", "<leader>s", ":x!<CR>")
map("n", "<leader>q", ":q!<CR>")

-- Update Plugins
map("n", "<leader>t", ":TSUpdate<CR>")
map("n", "<leader>u", ":PackerUpdate<CR>")
map("n", "<leader>i", ":PackerInstall<CR>")

-- Terminal
map('t', "<Esc>", "<C-\\><C-n>:q<CR>")
map('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 zsh<CR>")
