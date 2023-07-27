-- 返回插件的配置列表
return {
    -- 加入 tokyonight 主题
    "folke/tokyonight.nvim",
    -- 在加载插件时的 config 阶段会自动运行 function
    config = function()
        -- 设置 Neovim 主题为 tokyonigh-storm
        ---- :vim.cmd(): 执行 Vim Script 并返回值
        vim.cmd[[colorscheme tokyonight-storm]]
    end
}
