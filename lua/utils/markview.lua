vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim.git" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.keymap.set("n", "\\", "<CMD>Markview splitToggle<CR>", { buffer = true })
	end,
})
