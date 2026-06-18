vim.pack.add({
	{
		src = "https://github.com/ilgizar-khis/terminal.razigli.git",
		version = "master",
	},
})

local terminal = require("razigli.terminal")
terminal.setup({
	width = 160,
})

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "tt", terminal.toggle, { noremap = true, silent = true })
vim.keymap.set("n", "ее", terminal.toggle, { noremap = true, silent = true })
