vim.pack.add({
    'https://github.com/nvim-neo-tree/neo-tree.nvim',
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    -- optional, but recommended
    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
    window = {
        mappings = {
            ["l"] = "open",
            ["."] = "toggle_hidden",
        }
    }
})

vim.keymap.set("n", "<S-e>", "<CMD>Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "e", "<CMD>Neotree reveal<CR>", { noremap = true, silent = true })
