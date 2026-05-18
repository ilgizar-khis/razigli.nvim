vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim.git" },
})

require("toggleterm").setup({})

vim.keymap.set("n", "tt", "<CMD>ToggleTerm direction=float<CR>", { desc = "open terminal" })
vim.keymap.set("t", "<ESC>", "<CMD>ToggleTerm direction=float<CR>", { desc = "close terminal" })
vim.keymap.set("t", "<TAB>", "<CMD>wincmd w<CR>", { desc = "close terminal" })
