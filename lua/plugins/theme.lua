-- 返回插件的配置列表
return {
    -- 加入 tokyonight 主题
    "Mofiqul/dracula.nvim",
    -- 安装与 tokyonight 相兼容的插件，可以不以依赖的形式安装
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
        vim.cmd [[colorscheme dracula]]
        -- 加载 lualine 插件
        require('lualine').setup({
            -- 更改配置
            options = {
                -- 设置主题为 tokyonight
                theme = 'dracula-nvim'
            },
        })
        -- 启用上方标题栏插件
        require('barbecue').setup {
            -- 设置主题为 tokyonight
            theme = 'dracula-nvim',
        }
    end
}
