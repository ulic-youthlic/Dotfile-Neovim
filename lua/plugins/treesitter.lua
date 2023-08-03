return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    opts = {
        ensure_installed = "all",
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    },
}
