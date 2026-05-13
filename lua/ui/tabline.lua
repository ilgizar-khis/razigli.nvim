vim.pack.add({
	"https://github.com/nvim-mini/mini.tabline.git",
})

MiniTabline = require("mini.tabline")
MiniTabline.setup({
	format = function(buf_id, label)
		local selected = vim.api.nvim_get_current_buf() == buf_id
		local borderLeft, borderRight = " ", " "
		if selected then
			borderLeft, borderRight = "[", "]"
		end

		return borderLeft .. MiniTabline.default_format(buf_id, label) .. borderRight
	end,
})

local sel_hl = { bg = "none", fg = "#ffffff", bold = true }
local mod_hl = { bg = "none", fg = "#ffffff" }
local hl = { bg = "none", fg = "#888899" }

vim.api.nvim_set_hl(0, "MiniTablineCurrent", sel_hl)
vim.api.nvim_set_hl(0, "MiniTablineVisible", sel_hl)
vim.api.nvim_set_hl(0, "MiniTablineHidden", hl)
vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", sel_hl)
vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", sel_hl)
vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", mod_hl)
