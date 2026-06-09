-- LINE AND COLUMNS --
-- config number
vim.opt.number = true
vim.opt.relativenumber = true
-- signcolumn
vim.opt.signcolumn = "yes:2"
-- cursor
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
-- tabline
vim.opt.showtabline = 2
-- statusline
vim.opt.laststatus = 3

-- HL
-- basic
vim.cmd("colorscheme sorbet")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#000000", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#121212" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#ffffff" })
-- lines
vim.api.nvim_set_hl(0, "TabLine", { bg = "#000000" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#000000" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#000000" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#000000" })
-- cols
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ffcabc", bg = "none" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ffcabc", bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
-- popup menu

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
vim.opt.clipboard = "unnamedplus"

-- view
vim.opt.winborder = "single"
vim.opt.pumborder = "single"
vim.opt.fillchars = { eob = " " }

-- search
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

require("autoload").load()
