-- keywords
local keywords = {
	["ц"] = "w",
	["и"] = "b",
	["("] = "(",
	[")"] = ")",
	["х"] = "[",
	["ъ"] = "]",
	["Х"] = "{",
	["Ъ"] = "}",
	["э"] = '"',
	["Э"] = "'",
}

-- move cursor to
vim.keymap.set({ "n", "v" }, "р", "h", { noremap = true, silent = true }) -- left
vim.keymap.set({ "n", "v" }, "о", "j", { noremap = true, silent = true }) -- down
vim.keymap.set({ "n", "v" }, "л", "k", { noremap = true, silent = true }) -- up
vim.keymap.set({ "n", "v" }, "д", "l", { noremap = true, silent = true }) -- right
vim.keymap.set({ "n", "v" }, "пп", "gg", { noremap = true, silent = true }) -- start
vim.keymap.set({ "n", "v" }, "П", "G", { noremap = true, silent = true }) -- end

vim.keymap.set({ "n", "v" }, "ц", "w", { noremap = true, silent = true }) -- start of next word
vim.keymap.set({ "n", "v" }, "у", "e", { noremap = true, silent = true }) -- end of current or next word
vim.keymap.set({ "n", "v" }, "и", "b", { noremap = true, silent = true }) -- start of current or prev word
vim.keymap.set({ "n", "v" }, "Ц", "W", { noremap = true, silent = true }) -- start of next longword
vim.keymap.set({ "n", "v" }, "У", "E", { noremap = true, silent = true }) -- end of current or next longword
vim.keymap.set({ "n", "v" }, "И", "B", { noremap = true, silent = true }) -- start of current or prev longword

-- yank
vim.keymap.set("v", "н", "y", { noremap = true, silent = true }) -- yank selected
vim.keymap.set("n", "нн", "yy", { noremap = true, silent = true }) -- yank line

for key, word in pairs(keywords) do
	vim.keymap.set("n", "нш" .. key, "yi" .. word, { noremap = true, silent = true }) -- yank in keyword
	vim.keymap.set("n", "нф" .. key, "ya" .. word, { noremap = true, silent = true }) -- yank around keyword
end

-- enter to insert mode
vim.keymap.set("n", "ш", "i", { noremap = true, silent = true }) -- before the cursor
vim.keymap.set("n", "ф", "a", { noremap = true, silent = true }) -- after the cursor
vim.keymap.set("n", "ы", "s", { noremap = true, silent = true }) -- in the cursor
vim.keymap.set("n", "щ", "o", { noremap = true, silent = true }) -- below the cursor

for key, word in pairs(keywords) do
	vim.keymap.set("n", "сш" .. key, "ci" .. word, { noremap = true, silent = true }) -- change in keyword
	vim.keymap.set("n", "сф" .. key, "ca" .. word, { noremap = true, silent = true }) -- change around keyword
end

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

for key, word in pairs(keywords) do
	vim.keymap.set("n", "мш" .. key, "vi" .. word, { noremap = true, silent = true }) -- select in keyword
	vim.keymap.set("n", "мф" .. key, "va" .. word, { noremap = true, silent = true }) -- select around keyword
end

-- delete
vim.keymap.set("v", "в", "d", { noremap = true, silent = true }) -- delete selected
vim.keymap.set("n", "вв", "dd", { noremap = true, silent = true }) -- delete line
for key, word in pairs(keywords) do
	vim.keymap.set("n", "вш" .. key, "di" .. word, { noremap = true, silent = true }) -- delete all in keyword
	vim.keymap.set("n", "вф" .. key, "da" .. word, { noremap = true, silent = true }) -- delete all around keyword
end

-- write
vim.keymap.set("n", "Жц<CR>", ":w<CR>", { noremap = true, silent = true })
-- quit
vim.keymap.set("n", "Жй<CR>", ":q<CR>", { noremap = true, silent = true })
-- write and quit
vim.keymap.set("n", "Жцй<CR>", ":wq<CR>", { noremap = true, silent = true })
