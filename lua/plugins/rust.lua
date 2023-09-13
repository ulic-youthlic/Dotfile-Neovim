if (vim.fn.executable('rustc') == 1)
then
    return {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    }
else
    return {}
end
