vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim.git" },
})

require("toggleterm").setup({})

vim.keymap.set("n", "tt", "<CMD>ToggleTerm<CR>", { desc = "open terminal" })
vim.keymap.set("t", "<ESC>", "<CMD>ToggleTerm<CR>", { desc = "close terminal" })
vim.keymap.set("t", "<TAB>", "<CMD>wincmd w<CR>", { desc = "close terminal" })
