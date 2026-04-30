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
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
-- pairs
vim.opt.matchtime = 2
-- clipboard
vim.opt.clipboard = "unnamedplus"

require("lsp.lsp")
require("lsp.mason")
require("lsp.cmp")
require("lsp.formatter")
require("lsp.brackets")
require("lsp.command")

require("ui.colorscheme")
require("ui.tabline")
require("ui.statusline")
require("ui.terminal")
require("ui.telescope")
require("ui.filemanager")

require("keys.buffers")
require("pack.clear")
