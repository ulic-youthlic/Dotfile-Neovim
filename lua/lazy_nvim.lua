-- 自动下载 lazy.nvim 到指定位置
    -- 在用户数据文件夹里新建 ./lazy/lazy.nvim
    ---- :stdpath(): 返回 nvim 文件或文件夹的标准路径, "data" 参数会使其返回用户数据的文件夹路径
    ---- :..: 在 lua 中连接两个字符串
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    -- 如果 lazy.nvim 路径不存在，使用后 git 克隆
    if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    end

-- 将 lazy.nvim 的路径加入 Neovim 的 runtimepath，而且设为首项
vim.opt.rtp:prepend(lazypath)

-- 列出所需插件的列表
local plugins = {}

-- 写出 lazy.nvim 的配置选项
local opts = {}

-- 使用 lazy.nvim 安装插件
require("lazy").setup(plugins, opts)
