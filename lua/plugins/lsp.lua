return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            config = true
        },
        "williamboman/mason-lspconfig.nvim",
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
            event = "LspAttach",
            opts = {},
        },
        {
            "nvimdev/lspsaga.nvim",
            opts = {
                code_action = {
                    keys = {
                        quit = "<leader>qi",
                    },
                },
                outline = {
                    keys = {
                        quit = "<leader>qi",
                        toggle_or_jump = "x",
                        jump = "i",
                    },
                },
                diagnostic = {
                    keys = {
                        quit = [[<leader>qq]]
                    },
                },
            },
        },
    },
    config = function()
        local servers = {
            lua_ls = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
            pyright = {},
            bashls = {},
            clangd = {},
            jsonls = {},
        }

        require('neodev').setup({})
        require('neoconf').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        settings = servers[server_name]
                    }
                end
            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.keymap.set('n', '<leader>gc', vim.lsp.buf.declaration,
                    { buffer = ev.buf, desc = 'LSP: [g]oto de[c]laration' })
                vim.keymap.set('n', '<leader>gf', require("telescope.builtin").lsp_definitions,
                    { buffer = ev.buf, desc = 'LSP: [g]oto de[f]inition' })
                vim.keymap.set('n', '<leader>gi', require("telescope.builtin").lsp_implementations,
                    { buffer = ev.buf, desc = 'LSP: [g]oto [i]mplementation' })
                vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references,
                    { buffer = ev.buf, desc = 'LSP: [g]oto [r]eferences' })
                vim.keymap.set('n', '<leader>gd', require("telescope.builtin").diagnostics,
                    { buffer = ev.buf, desc = "LSP: [g]oto [d]iadnostics" })
                vim.keymap.set('n', '<leader>gt', require("telescope.builtin").lsp_type_definitions,
                    { buffer = ev.buf, desc = "LSP: [g]oto [t]ype definition" })

                vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>",
                    { buffer = ev.buf, desc = 'LSP: Hover Documantation' })
                vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help,
                    { buffer = ev.buf, desc = 'LSP: Signature Documentation' })
                vim.keymap.set('n', '<leader>kf', function()
                    vim.lsp.buf.format { async = true }
                end, { buffer = ev.buf, desc = 'LSP: [f]ormat code' })
                vim.keymap.set('n', "<leader>kd", "<cmd>lua vim.diagnostic.open_float()<CR>",
                    { buffer = ev.buf, desc = "LSP: Open a float window for [d]iagnostic" })
                vim.keymap.set('n', '<leader>kn', "<cmd>Lspsaga diagnostic_jump_next<CR>",
                    { buffer = ev.buf, desc = "LSP: Get the [n]ext diagnostic" })
                vim.keymap.set('n', '<leader>kp', "<cmd>Lspsaga diagnostic_jump_prev<CR>",
                    { buffer = ev.buf, desc = "LSP: Get the [p]revious diagnostic" })
                vim.keymap.set("n", "<leader>ko", "<cmd>Lspsaga outline<CR>",
                    { buffer = ev.buf, desc = 'LSP: Open the [o]utline of current file' })
                vim.keymap.set({ 'n', 't' }, '<leader>kt', '<cmd>Lspsaga term_toggle<CR>',
                    { buffer = ev.buf, desc = "Toggle to a float [t]erminal" })

                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
                    { buffer = ev.buf, desc = 'LSP: [w]orkspace [a]dd folder' })
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
                    { buffer = ev.buf, desc = 'LSP: [w]orkspace [r]emove folder' })
                vim.keymap.set('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, { buffer = ev.buf, desc = 'LSP: [w]orkspace [l]ist foler' })


                vim.keymap.set('n', '<leader>rn', "<cmd>Lspsaga rename ++project<CR>",
                    { buffer = ev.buf, desc = 'LSP: ' .. '[r]e[n]ame' })
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', "<cmd>Lspsaga code_action<CR>",
                    { buffer = ev.buf, desc = 'LSP: ' .. '[c]ode [a]ction' })
            end
        })
    end
}
