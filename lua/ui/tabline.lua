vim.pack.add({
	"https://github.com/nvim-mini/mini.tabline.git"
})

local MiniTabline = require("mini.tabline")
MiniTabline.setup()

local selected = {bg = "none", fg = "#ffffff", bold = true}
local modified = {bg = "none", fg = "#ffffff"}
local hl = {bg = "none", fg = "#ffcabc"}

vim.api.nvim_set_hl(0, "MiniTablineCurrent", selected)
vim.api.nvim_set_hl(0, "MiniTablineVisible", selected)
vim.api.nvim_set_hl(0, "MiniTablineHidden", hl)
vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", selected)
vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", selected)
vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", modified)
