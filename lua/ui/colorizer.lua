vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua.git" })

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
