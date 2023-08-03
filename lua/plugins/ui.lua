return {
    {
        "akinsho/bufferline.nvim",
        config = {}
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        opts = {
            indent = {
                chars = {
                    "│",
                    "¦",
                    "┆",
                    "┊",
                },
                use_treesitter = true,
            },
            blank = {
                chars = {
                    "․",
                    "⁚",
                    "⁖",
                    "⁘",
                    "⁙",
                },
                style = {
                    "#666666",
                    "#555555",
                    "#444444",
                },
            }
        },
    },
    {
        -- 安装 git 标志支持
        "lewis6991/gitsigns.nvim",
        opts = { -- 等价于 config = function() require(gitsigns).setup(opts) end
            -- 打开 line blame
            current_line_blame = true,
            -- 配置 line blame 选项
            current_line_blame_opts = {
                -- 显示虚拟文字
                virt_text = true,
                -- 设置 line blame 的位置为行末
                virt_text_pos = 'eol',
                -- 延迟为 100 ms
                delay = 100,
                -- 不忽略空白字符
                ignore_whitespace = false,
            },
            -- 设置 line blame 显示格式
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        }
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
    {
        "RRethy/vim-illuminate",
        event = "InsertEnter",
        config = function()
            require('illuminate').configure()
        end
    },
}
