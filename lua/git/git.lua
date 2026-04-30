vim.pack.add({ "https://github.com/NeogitOrg/neogit.git" })

require("neogit").setup({
	integrations = {
		diffview = true,
	},
})
