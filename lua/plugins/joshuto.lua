if (vim.fn.executable('joshuto') == 1)
then
    return {
        "theniceboy/joshuto.nvim",
        config = function()
            require 'joshuto'.setup()
            vim.keymap.set('n', "<C-n>", [[<cmd>Joshuto<CR>]], { desc = [[Open joshuto file manager]] })
        end
    }
else
    return {}
end
