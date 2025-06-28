require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Global LSP on_attach function
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        -- LSP keybindings
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end
})

require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = {
        "gopls",
        "ts_ls", 
        "eslint",
    },
})

-- Setup all installed servers
local mason_lspconfig = require("mason-lspconfig")
local installed_servers = mason_lspconfig.get_installed_servers()

for _, server_name in pairs(installed_servers) do
    require("lspconfig")[server_name].setup({})
end

-- Auto-prompt for missing LSP servers
local lspconfig = require("lspconfig")

