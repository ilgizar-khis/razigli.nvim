-- move cursor to
vim.keymap.set({ "n", "v" }, "р", "h", { noremap = true, silent = true }) -- left
vim.keymap.set({ "n", "v" }, "о", "j", { noremap = true, silent = true }) -- down
vim.keymap.set({ "n", "v" }, "л", "k", { noremap = true, silent = true }) -- up
vim.keymap.set({ "n", "v" }, "д", "l", { noremap = true, silent = true }) -- right
vim.keymap.set({ "n", "v" }, "пп", "gg", { noremap = true, silent = true }) -- start
vim.keymap.set({ "n", "v" }, "П", "G", { noremap = true, silent = true }) -- end

-- enter to insert mode
vim.keymap.set("n", "ш", "i", { noremap = true, silent = true }) -- before the cursor
vim.keymap.set("n", "ф", "a", { noremap = true, silent = true }) -- after the cursor
vim.keymap.set("n", "ы", "s", { noremap = true, silent = true }) -- in the cursor
vim.keymap.set("n", "щ", "o", { noremap = true, silent = true }) -- below the cursor
vim.keymap.set("n", "с", "c", { noremap = true, silent = true }) -- change

vim.keymap.set("n", "Ш", "I", { noremap = true, silent = true }) -- start of line
vim.keymap.set("n", "Ф", "A", { noremap = true, silent = true }) -- end of line
vim.keymap.set("n", "Ы", "S", { noremap = true, silent = true }) -- in the line
vim.keymap.set("n", "Щ", "O", { noremap = true, silent = true }) -- above the cursor
vim.keymap.set("n", "С", "C", { noremap = true, silent = true }) -- change line

-- undo/redo
vim.keymap.set("n", "г", "u", { noremap = true, silent = true }) -- undo
vim.keymap.set("n", "Г", "U", { noremap = true, silent = true }) -- undo line
vim.keymap.set("n", "<C-к>", "<C-r>", { noremap = true, silent = true }) -- redo

-- replace
vim.keymap.set("n", "к", "r", { noremap = true, silent = true }) -- symbol
vim.keymap.set("n", "К", "R", { noremap = true, silent = true }) -- mode

-- enter to visual mode
vim.keymap.set("n", "м", "v", { noremap = true, silent = true }) -- in cursor
vim.keymap.set("n", "М", "V", { noremap = true, silent = true }) -- in line
