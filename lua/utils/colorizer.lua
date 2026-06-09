vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua.git" })

vim.opt.termguicolors = true

require("colorizer").setup({
	options = {
		display = {
			mode = "virtualtext",
			virtualtext = {
				position = "after",
				hl_mode = "foreground",
			},
		},
	},
})
