local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
  }
})
vim.keymap.set('n', '<leader>pf', function()
	local core = require('nvim-tree.core')
	local cwd = core.get_cwd() or vim.fn.getcwd()
	builtin.find_files({ 
		cwd = cwd,
		file_ignore_patterns = { "node_modules", ".git" }
	})
end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("grep > ") });
end)
