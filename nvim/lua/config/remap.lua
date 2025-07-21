vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('i', '<C-h>', '<C-w>')
vim.keymap.set('n', '<F5>', ':tabnew<CR>')
vim.keymap.set('n', '<F7>', ':tabn<CR>')
vim.keymap.set('n', '<F6>', ':-tabn<CR>')
vim.keymap.set('n', '<F8>', ':q<CR>')

-- Resize window height function
local function resize_height(amount)
    local current_height = vim.api.nvim_win_get_height(0)
    vim.api.nvim_win_set_height(0, current_height + amount)
end

vim.keymap.set("n", "<leader>+", function() resize_height(5) end)
vim.keymap.set("n", "<leader>-", function() resize_height(-5) end)
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><right>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><tab>', '<C-w>w', { noremap = true, silent = true }) -- Cycle through windows

-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Swedish keyboard friendly line navigation
vim.keymap.set("n", "<leader>e", "$", { desc = "End of line" })          -- Space + e = end of line
vim.keymap.set("n", "<leader>,", "^", { desc = "Beginning of line" })     -- Space + , = beginning (first non-whitespace)
vim.keymap.set("n", "<leader>0", "0", { desc = "Start of line" })         -- Space + 0 = absolute start of line

-- LSP Diagnostics keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'List all diagnostics' })
 
