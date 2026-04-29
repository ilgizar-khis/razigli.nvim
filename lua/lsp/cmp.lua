vim.pack.add({
	"https://github.com/saghen/blink.cmp.git",
	"https://github.com/saghen/blink.lib.git",
})

local BlinkCmp = require("blink.cmp")
BlinkCmp.build():wait(60000)
BlinkCmp.setup({
	keymap = {
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
	},
})
