return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            config = true
        },
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local servers = {
            lua_ls = {},
            pyright = {},
            bashls = {},
        }

        require('mason-lspconfig').setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup{
                        settings = servers[server_name]
                    }
                end
            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer = ev.buf, desc = 'LSP: ' .. '[g]oto [D]eclaration'})
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = ev.buf, desc = 'LSP: ' .. '[g]oto [d]efination'})
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = ev.buf, desc = 'LSP: ' .. 'Hover Documantation'})
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = ev.buf, desc = 'LSP: ' .. '[g]oto [i]mplementation'})
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {buffer = ev.buf, desc = 'LSP: ' .. 'Signature Documentation'})
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {buffer = ev.buf, desc = 'LSP: ' .. '[w]orkspace [a]dd folder'})
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {buffer = ev.buf, desc = 'LSP: ' .. '[w]orkspace [r]emove folder'})
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, {buffer = ev.buf, desc = 'LSP: ' .. '[w]orkspace [l]ist foler'})
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {buffer = ev.buf, desc = 'LSP: ' .. 'Type [D]efination'})
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {buffer = ev.buf, desc = 'LSP: ' .. '[r]e[n]ame'})
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {buffer = ev.buf, desc = 'LSP: ' .. '[c]ode [a]ction'})
                vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {buffer = ev.buf, desc = 'LSP: ' .. '[g]oto [r]eferences'})
                -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = ev.buf, desc = 'LSP: ' .. '[g]oto [r]eferences'})
                vim.keymap.set('n', '<A-f>', function()
                    vim.lsp.buf.format { async = true }
                end, {buffer = ev.buf, desc = 'LSP: ' .. '[f]ormat code'})
            end
        })
    end
}
