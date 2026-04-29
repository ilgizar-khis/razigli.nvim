vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim.git" })

require("gruvbox").setup({
	transparent_mode = true,
})
vim.cmd.colorscheme("gruvbox")

vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
