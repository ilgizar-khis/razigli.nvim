vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim.git" },
})

require("toggleterm").setup({})

vim.keymap.set("n", "tt", "<CMD>ToggleTerm<CR>")
vim.keymap.set("t", "<ESC>", "<CMD>ToggleTerm<CR>")
