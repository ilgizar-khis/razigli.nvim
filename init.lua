-- config number and signcolumn
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:2"

vim.api.nvim_set_hl(0, "LineNr", {fg = "#ffffff"})
vim.api.nvim_set_hl(0, "LineNrAbove", {fg = "#ffcabc"})
vim.api.nvim_set_hl(0, "LineNrBelow", {fg = "#ffcabc"})

-- indents config
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true

-- UX config
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.clipboard = "unnamedplus"

