local option = vim.opt
local buffer = vim.b
local global = vim.g


-- 0.配置参数
---- undo 文件的目录
local UNDO_FILE_DIR = [[$HOME/.local/share/nvim/undo]]
---- 是否开启终端真色彩显示
local TERMINAL_GUI_COLORS = true
---- leader 键
global.mapleader = " "
---- 编码方式
buffer.fileencoding = "utf-8"
---- key mappings
local nmappings = {
    ---- 禁用上下左右
    { mode = { "n", "i", "v" }, from = "<Up>",       to = "<Nop>",            desc = "Dont use Up." },
    { mode = { "n", "i", "v" }, from = "<Down>",     to = "<Nop>",            desc = "Dont use Down." },
    { mode = { "n", "i", "v" }, from = "<Left>",     to = "<Nop>",            desc = "Dont use Left." },
    { mode = { "n", "i", "v" }, from = "<Right>",    to = "<Nop>",            desc = 'Dont use Right.' },

    ---- Buffer 操作
    ---- 下一个 Buffer
    { mode = "n",               from = "<S-Tab>",    to = "<cmd>bNext<CR>",   desc = "Go to the next buffer" },
    ---- 关闭 Buffer
    { mode = "n",               from = "<leader>x",  to = "<cmd>bd<CR>",      desc = "Close the current buffer" },

    ---- 重定义块可视化
    { mode = "n",               from = "<leader>v",  to = "<C-v>",            desc = "Switch to Virtual block mode" },

    ---- 整体移动选中区域
    { mode = "v",               from = "J",          to = ":m '>+1<CR>gv=gv", desc = "Move the checked area up" },
    { mode = "v",               from = "K",          to = ":m '<-2<CR>gv=gv", desc = "Move the checked area down" },

    ---- 光标在窗口间移动
    { mode = "n",               from = "<C-h>",      to = "<C-w>h",           desc = "Go to the left window" },
    { mode = "n",               from = "<C-j>",      to = "<C-w>j",           desc = "Go to the lower window" },
    { mode = "n",               from = "<C-k>",      to = "<C-w>k",           desc = "Go to the upper window" },
    { mode = "n",               from = "<C-l>",      to = "<C-w>l",           desc = "Go to the right window" },

    ---- 保存
    { mode = "n",               from = "<leader>wi", to = ":w<CR>",           desc = "Save the current file" },
    { mode = "n",               from = "<leader>wo", to = ":wa<CR>",          desc = "Save all file" },

    ---- 分屏
    { mode = "n",               from = "<leader>i",  to = ":vsp<CR>",         desc = "Split the window vertically" },
    { mode = "n",               from = "<leader>o",  to = ":sp<CR>",          desc = "Split the window horizontally" },
    ---- 关闭窗口
    { mode = "n",               from = "<leader>qo", to = "<cmd>qa<CR>",      desc = "Close all windows" },
    { mode = "n",               from = "<leader>qi", to = "<cmd>q<CR>",       desc = "Close the current window" },
    { mode = "n",               from = "<leader>qq", to = "<C-w>o",           desc = "Close the other windows" },

    ---- 快速行首行末跳转
    {
        mode = "n",
        from = "<leader>J",
        to = "^",
        desc =
        "Jump to the first non-white space character"
    },
    { mode = "n", from = "<leader>H", to = "0", desc = "Jump to the beginning of the line" },
    { mode = "n", from = "<leader>L", to = "$", desc = "Jump to the end of the line" },

    ---- 符号对之间相互跳转
    {
        mode = "n",
        from = "m",
        to = "%",
        desc =
        "Jump to the other of a pair of characters"
    },

    ---- 执行宏
    { mode = "n",          from = [[\]],       to = [[@]], desc = "Execute macro recording" },

    ---- Yank into regions
    { mode = { "v", "n" }, from = "<leader>y", to = '"+y', desc = "Yank content into sys clipboard" },
}

-- 1.Global Settings --
---- 原生左下角的模式显示
option.showmode = false -- 为 plugin 做准备

---- 退格键的作用
---- :indent: 可以删除 nvim 自动添加的缩进
---- :eol: 可以删除行末符号，'\n\r' 或 '\n'，未启用时退格键无法删除t空行
---- :start: 关闭只能删除本次插入的文本，允许对删除所有文本
option.backspace = { "indent", "eol", "start" }

---- 实际制表符的宽度，不影响 <Tab> 是否以空格储存
option.tabstop = 4
---- 代码缩进的宽度，不影响 <Tab> 是否以空格储存
option.shiftwidth = 4
---- 是否将 <Tab> 转换为空格键
option.expandtab = true
---- 控制 '>>' '<<' 命令前或后时缩进是否为 'shiftwidth' 的倍数
option.shiftround = true
---- 在插入新行时，自动缩进到同一层级
option.autoindent = true
---- 在编辑代码时，提供更智能的缩进
option.smartindent = true

---- 显示行号
option.nu = true  -- option.number = true
---- 显示相对行号
option.rnu = true -- option.relativenumber = true

---- 命令模式下 Tab 键候选菜单开启
option.wildmenu = true

---- 搜索时是否高亮匹配词
option.hlsearch = false

---- 在搜索操作时忽略大小写
option.ignorecase = true
---- 在搜索操作中智能处理大小写敏感性
option.smartcase = true
-- 如有一个字母大写，则大小写敏感，否则大小写不敏感

---- 自动补全
---- :menu: 这个参数表示在自动完成时，如果有多个候选项可以选择，将显示一个包含候选项列表的菜单。这样你可以使用上下箭头键或 Tab 键来浏览候选项，并使用 Enter 键来选择。
---- :noselect: 初始强制选择第一个选项，而不是根据匹配选择初始选项
option.completeopt = { "menu", "noselect" }

---- 高亮当前行
option.cursorline = true

---- 启用终端真色彩显示，终端可能不支持
option.termguicolors = TERMINAL_GUI_COLORS

---- 用于控制行号列和折叠标志列的显示方式，可以设置为 'yes' 'auto' 'no'。
option.signcolumn = "yes"

---- 自动读取外部修改，使缓冲区和文件实际内容一致
option.autoread = true

---- 在终端标题栏里自动显示编辑器及文件
option.title = true

---- 关闭 swap 文件
option.swapfile = false

---- 关闭备份，Neovim 将不会在b目录下创建以 ~ 结尾的备份文件
option.backup = false

---- 自动保存的时间（ms）
option.updatetime = 50

---- 启用鼠标支持，并允许在所有模式下进行交互操作
option.mouse = "a"

---- 开启 undo 文件
option.undofile = true
---- undo 文件目录
option.undodir = vim.fn.expand(UNDO_FILE_DIR)

---- 允许 Neovim 启动时加载当前目录的 init.vim 或 init.lua
option.exrc = true

vim.cmd [[set scrolloff=5]]

---- 过长行不拆成多行显示，仅展示前半部分
option.wrap = false

---- 打开新文件在右边显示
option.splitright = true
---- 打开新文件在下方显示
option.splitbelow = true

---- 高亮粘贴区域
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
    end,
})

-- 2.Buffer Settings --
for _, map in ipairs(nmappings) do
    vim.keymap.set(map.mode, map.from, map.to, { desc = map.desc })
end
