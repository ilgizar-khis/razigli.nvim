vim.pack.add({
	"https://github.com/NeogitOrg/neogit.git",
})

require("neogit").setup({
	highlight = {
		italic = true,
		bold = true,
		underline = true,
	},
})
