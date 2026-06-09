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
-- cols
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ffcabc", bg = "none" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ffcabc", bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })

-- KEYMAP
-- tabs and buffers
vim.keymap.set("n", "<M-h>", "<CMD>bprev<CR>", { noremap = true, silent = true }) -- to prev buffer
vim.keymap.set("n", "<M-l>", "<CMD>bnext<CR>", { noremap = true, silent = true }) -- to next buffer
-- wins
vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>", { noremap = true, silent = true }) -- to left win
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>", { noremap = true, silent = true }) -- to right win
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>", { noremap = true, silent = true }) -- to down win
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>", { noremap = true, silent = true }) -- to up win
vim.keymap.set("n", "<Tab>", "<CMD>wincmd w<CR>", { noremap = true, silent = true }) -- to next win
vim.keymap.set("n", "<S-Tab>", "<CMD>wincmd W<CR>", { noremap = true, silent = true }) -- to next win
vim.keymap.set("n", "\\", "<CMD>vsplit<CR>", { noremap = true, silent = true }) -- vertical split
vim.keymap.set("n", "|", "<CMD>split<CR>", { noremap = true, silent = true }) -- horizontal split

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
