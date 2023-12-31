return {
    {
        "rhysd/accelerated-jk",
        config = function()
            vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "Faster and faster 'j'" })
            vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "Faster and faster 'k'" })
        end
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function()
            require("persistence").setup()
            -- restore the session for the current directory
            vim.api.nvim_set_keymap("n", "<leader>lc", [[<cmd>lua require("persistence").load()<cr>]],
                { desc = "Restore the [l]ayout for the [c]urrent director" })
            -- restore the last session
            vim.api.nvim_set_keymap("n", "<leader>ll", [[<cmd>lua require("persistence").load({ last = true })<cr>]],
                { desc = "Restore the [l]ast [l]ayout" })
            -- stop Persistence => session won't be saved on exit
            vim.api.nvim_set_keymap("n", "<leader>ld", [[<cmd>lua require("persistence").stop()<cr>]],
                { desc = "Stop save the layout of windows and buffers" })
        end
    },
    {
        "windwp/nvim-autopairs",
        opts = {
            enable_check_bracket_line = true,
        },
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "folke/flash.nvim",
        event = "BufNew",
        config = function()
            require("flash").setup()
            vim.keymap.set({ "n", "x", "o" }, "s",
                function()
                    require("flash").jump(
                        {
                            search = {
                                mode = function(str)
                                    return "\\<" .. str
                                end,
                            },
                        }
                    )
                end,
                {
                    desc = "Toggle to specific character"
                }
            )
            vim.keymap.set({ "n", "x", "o" }, "<C-s>",
                function()
                    require("flash").treesitter()
                end,
                {
                    desc = "Choose specific area"
                }
            )
            vim.keymap.set("o", "r",
                function()
                    require("flash").remote()
                end,
                {
                    desc = "Toggle to specific character, and operate it"
                }
            )
            vim.keymap.set({ "o", "x" }, "R",
                function()
                    require("flash").treesitter_search()
                end,
                {
                    desc = "Operate specific characters"
                }
            )
        end,
    },
    {
        "ellisonleao/glow.nvim",
        event = "VeryLazy",
        config = function()
            require("glow").setup()
            vim.keymap.set("n", "<A-g>", ":Glow<CR>", { desc = "Preview the current file" })
        end
    },
    {
        {
            "nvim-neo-tree/neo-tree.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
            config = function()
                require("neo-tree").setup()
                vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Open the file tree" })
            end
        }
    },
    {
        "folke/which-key.nvim",
        config = true
    },
    {
        "echasnovski/mini.ai",
        config = true
    },
    {
        "echasnovski/mini.comment",
        config = true
    },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            'smoka7/hydra.nvim',
        },
        config = function()
            local N = require 'multicursors.normal_mode'
            local I = require 'multicursors.insert_mode'
            require("multicursors").setup(
                {
                    normal_keys = {
                        -- to change default lhs of key mapping change the key
                        [','] = {
                            -- assigning nil to method exits from multi cursor mode
                            method = N.clear_others,
                            -- you can pass :map-arguments here
                            opts = { desc = 'Clear others' },
                        },
                    },
                    insert_keys = {
                        -- to change default lhs of key mapping change the key
                        ['<CR>'] = {
                            -- assigning nil to method exits from multi cursor mode
                            method = I.Cr_method,
                            -- you can pass :map-arguments here
                            opts = { desc = 'New line' },
                        },
                    },
                }
            )
            vim.keymap.set({ "n", "v" }, "<C-m>", "MCstart<CR>", { desc = "Start multi cursors mode" })
        end,
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
        keys = {
            {
                mode = { 'v', 'n' },
                '<Leader>m',
                '<cmd>MCstart<cr>',
                desc = 'Create a selection for selcted text or word under the cursor',
            },
        },
    },
    {
        'junegunn/vim-peekaboo',
        init = function()
        end,
    }
}
