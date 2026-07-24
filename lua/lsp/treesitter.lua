vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter.git" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "lua", "json", "qml", "rust", "java" },
	callback = function()
		vim.treesitter.start()
	end,
})
