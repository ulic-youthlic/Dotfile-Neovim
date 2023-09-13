-- 返回插件的配置列表
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    dependencies = {
        -- 下方状态栏插件
        "nvim-lualine/lualine.nvim",
        -- 为状态栏提供图标的插件
        "nvim-tree/nvim-web-devicons",
        -- 上方标题栏插件
        "utilyre/barbecue.nvim",
        -- 被标题栏插件依赖
        "SmiteshP/nvim-navic",
    },
    -- 在加载插件时的 config 阶段会自动运行 function
    config = function()
        -- 设置 Neovim 主题为 tokyonigh-storm
        ---- :vim.cmd(): 执行 Vim Script 并返回值
        vim.cmd [[colorscheme catppuccin-macchiato]]
        -- 加载 lualine 插件
        require('lualine').setup({
            -- 更改配置
            options = {
                -- 设置主题为 tokyonight
                theme = 'catppuccin-macchiato'
            },
        })
        -- 启用上方标题栏插件
        require('barbecue').setup {
            -- 设置主题为 tokyonight
            theme = 'catppuccin-macchiato',
        }
    end
}
