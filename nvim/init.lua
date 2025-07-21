require("config")
local set = vim.opt
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.number = true
set.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left in insert mode' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down in insert mode' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up in insert mode' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right in insert mode' })

