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
