vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim.git" })

require("render-markdown").setup({
	completions = {
		lsp = {
			enabled = true,
		},
	},
	code = {
		left_pad = 2,
	},
})
