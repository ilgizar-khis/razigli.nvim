-- mode by buffers
vim.keymap.set("n", "<M-h>", "<CMD>bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", "<CMD>bnext<CR>", { noremap = true, silent = true })
-- move by windows
vim.keymap.set("n", "<C-h>", "<CMD>wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<CMD>wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<CMD>wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<CMD>wincmd l<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", "<CMD>wincmd w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<CMD>wincmd W<CR>", { noremap = true, silent = true })
-- windows splits
vim.keymap.set("n", "\\", "<CMD>vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "|", "<CMD>split<CR>", { noremap = true, silent = true })
