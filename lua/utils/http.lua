vim.pack.add({
	"https://github.com/mistweaverco/kulala.nvim.git",
})

require("kulala").setup({
	kulala_core = {
		download_url = "https://core.kulala.app/releases/%s/%s",
	},
})
