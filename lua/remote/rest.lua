vim.pack.add({
	"https://github.com/mistweaverco/kulala.nvim.git",
})

local kulala = require("kulala")
kulala.setup({
	global_keymaps = false,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "http", "rest" },
	callback = function()
		vim.keymap.set("n", "<CR>", kulala.run, { buffer = true, desc = "Send request" })
		vim.keymap.set("n", "<Space>", kulala.toggle_view, { buffer = true, desc = "Send request" })
		vim.keymap.set("n", "l", kulala.jump_next, { buffer = true, desc = "Send request" })
		vim.keymap.set("n", "h", kulala.jump_prev, { buffer = true, desc = "Send request" })
	end,
})
