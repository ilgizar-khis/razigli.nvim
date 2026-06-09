vim.pack.add({
	"https://github.com/nvim-mini/mini.tabline.git"
})

local MiniTabline = require("mini.tabline")
MiniTabline.setup({
	format = function(buf_id, label)
		local selected = vim.api.nvim_get_current_buf() == buf_id
		local suffix = vim.bo[buf_id].modified and " +" or "  "
		local borderLeft, borderRight = " ", " "
		if selected then
			borderLeft, borderRight = "[", "]"
		end

		return borderLeft .. suffix .. MiniTabline.default_format(buf_id, label) .. borderRight
	end,
})

local selected = {bg = "none", fg = "#ffffff", bold = true}
local modified = {bg = "none", fg = "#ffffff"}
local hl = {bg = "none", fg = "#ffcabc"}

vim.api.nvim_set_hl(0, "MiniTablineCurrent", selected)
vim.api.nvim_set_hl(0, "MiniTablineVisible", selected)
vim.api.nvim_set_hl(0, "MiniTablineHidden", hl)
vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", selected)
vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", selected)
vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", modified)
