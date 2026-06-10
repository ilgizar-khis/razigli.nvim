-- from oficial github repo
vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	-- optional, but recommended
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
	filesystem = {
		scan_mode = "deep",
		group_empty_dirs = true,
	},
	window = {
		mappings = {
			["l"] = "open",
			["L"] = "expand_all_subnodes",
			["H"] = "set_root",
			["."] = "toggle_hidden",
		},
	},
})

-- close and open keymap
vim.keymap.set("n", "<S-e>", "<CMD>Neotree toggle<CR>", { noremap = true, silent = true })

-- highlights
-- vim.api.nvim_set_hl(0, "NeoTreeFilterTerm", {})
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "#565656", fg = "#111111" })
vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#565656", fg = "#ffffff" })
