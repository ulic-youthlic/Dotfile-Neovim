return {
    -- 引入 telescope 插件
    "nvim-telescope/telescope.nvim",
    -- 写入依赖插件
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            -- 引入 fzf 插件作为依赖
            'nvim-telescope/telescope-fzf-native.nvim',
            -- 同步仓库后使用系统命令执行编译
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
    },
    -- 配置函数, 具体查阅 telescope.nvim 仓库
    config = function()
        -- You dont need to set any of these options. These are the default ones. Only
        -- the loading is important
        require('telescope').setup {
            -- 引入 fzf 插件
            extensions = {
                fzf = {
                    fuzzy = true,                   
                    override_generic_sorter = true,
                    override_file_sorter = true,  
                    case_mode = "smart_case",    
                }
            }
        }
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        -- 载入 fzf 插件
        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')
        -- 搜索当前目录下的文件
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        -- 搜索当前目录下文件的内容
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        -- 搜索 Neovim 打开的所有 Buffers
        vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
        -- 搜索 Neovim 的帮助文档 tag
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        -- 搜索最近打开的文件
        vim.keymap.set('n', '<leader>?', builtin.oldfiles, 
            {
                desc = '[?] Find recently opened files'
            }
        )
        -- 搜索当前打开的 Buffer 的内容
        vim.keymap.set('n', '<leader>/',
            function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown
                    {
                        winblend = 10,
                        perviewer = false,
                    }
                )
            end,
            {
                desc = '[?] Find recently opened files'
            }
        )
    end
}
