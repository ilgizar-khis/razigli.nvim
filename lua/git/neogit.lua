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

-- hl to diffview
vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "#000000", fg = "#abffab", bold = true })
vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "#000000", fg = "#ffabab", bold = true })
vim.api.nvim_set_hl(0, "NeogitDiffAddInline", { bg = "#008900", fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "NeogitDiffDeleteInline", { bg = "#890000", fg = "#ffffff", bold = true })
-- hl to commit buffer
vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "#000000", fg = "#abffab", bold = true })
vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#000000", fg = "#ffabab", bold = true })
