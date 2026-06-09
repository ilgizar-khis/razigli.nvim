-- config number and signcolumn
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:2"
vim.api.nvim_set_hl(0, "LineNr", {fg = "#ffffff"})
vim.api.nvim_set_hl(0, "LineNrAbove", {fg = "#ffcabc"})
vim.api.nvim_set_hl(0, "LineNrBelow", {fg = "#ffcabc"})

