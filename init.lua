-- search
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- lines and columns
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.winborder = "single"
vim.opt.fillchars = { eob = " " }
-- pairs
vim.opt.matchtime = 2
-- clipboard
vim.opt.clipboard = "unnamedplus"

require("autoload").load()
