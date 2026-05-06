vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter.git" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "lua", "json" },
	callback = function()
		vim.treesitter.start()
		print("python")
	end,
})
