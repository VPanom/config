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
        -- Open definition in a new tab
        vim.keymap.set('n', 'gd', function()
            -- Save the original handler
            local original_handler = vim.lsp.handlers['textDocument/definition']

            -- Temporarily override the handler to open in a new tab
            vim.lsp.handlers['textDocument/definition'] = function(err, result, ctx, config)
                -- Restore the original handler immediately
                vim.lsp.handlers['textDocument/definition'] = original_handler

                if err then
                    vim.notify('Error getting definition: ' .. tostring(err), vim.log.levels.ERROR)
                    return
                end

                if not result or vim.tbl_isempty(result) then
                    vim.notify('Definition not found', vim.log.levels.WARN)
                    return
                end

                -- Open a new tab
                vim.cmd('tabnew')

                -- Call the original handler which will open the file in the new tab
                if original_handler then
                    original_handler(err, result, ctx, config)
                else
                    -- Fallback to default behavior if no original handler
                    vim.lsp.util.jump_to_location(result[1] or result, 'utf-8')
                end
            end

            -- Request the definition (this will trigger our custom handler)
            vim.lsp.buf.definition()
        end, opts)
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

-- Setup all installed servers with cmp capabilities
local mason_lspconfig = require("mason-lspconfig")
local installed_servers = mason_lspconfig.get_installed_servers()

-- Get cmp capabilities if available (set in after/plugin/cmp.lua)
local capabilities = _G.cmp_nvim_lsp_capabilities or vim.lsp.protocol.make_client_capabilities()

for _, server_name in pairs(installed_servers) do
    require("lspconfig")[server_name].setup({
        capabilities = capabilities,
    })
end

-- Auto-prompt for missing LSP servers
local lspconfig = require("lspconfig")

