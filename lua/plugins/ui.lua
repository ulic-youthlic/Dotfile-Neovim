return {
    {
        -- 添加插件
        "akinsho/bufferline.nvim",
        -- 启用插件
        config = {} -- 也可以写成 true
        -- 等价于
        -- config = function()
        --     require("bufferline").setup({})
        -- end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = true
    },
}
