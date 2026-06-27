-- LINE AND COLUMNS --
-- config number
vim.opt.number = true
vim.opt.relativenumber = true
-- signcolumn
vim.opt.signcolumn = "yes:2"
-- cursor
vim.opt.cursorline = false
vim.opt.cursorcolumn = false

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
