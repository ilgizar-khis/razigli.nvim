-- HL
-- basic
vim.cmd("colorscheme desert")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#121212" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#ffffff" })
-- cols
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ffcabc", bg = "none" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ffcabc", bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
-- code
vim.api.nvim_set_hl(0, "Comment", { fg = "#ababab", italic = true })
vim.api.nvim_set_hl(0, "String", { fg = "#ffab00" })
