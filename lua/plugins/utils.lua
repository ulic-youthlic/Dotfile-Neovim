return {
    {
        "rhysd/accelerated-jk",
        config = function()
            vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
            vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
        end
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function()
            require("persistence").setup()
            -- restore the session for the current directory
            vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})
            -- restore the last session
            vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})
            -- stop Persistence => session won't be saved on exit
            vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})
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
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("flash").setup()
            vim.keymap.set({"n", "x", "o"}, "s",
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
                end
            )
            vim.keymap.set({"n", "x", "o"}, "<C-s>",
                function()
                    require("flash").treesitter()
                end
            )
            vim.keymap.set("o", "r",
                function()
                    require("flash").remote()
                end
            )
            vim.keymap.set({"o", "x"}, "R",
                function()
                    require("flash").treesitter_search()
                end
            )
        end,
    },
    {
        "kamykn/spelunker.vim",
        config = function()
            vim.g.spelunker_check_type = 2
        end
    },
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup()
            vim.keymap.set("n", "<A-g>", ":Glow<CR>")
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
                vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
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
}
