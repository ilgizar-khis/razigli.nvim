vim.pack.add({
	{
		src = "https://github.com/ilgizar-khis/packs.razigli.git",
		version = "main",
	},
})

local packs = require("packs.razigli")
packs.setup({
	width = 130,
})

vim.api.nvim_create_user_command("Packs", function()
	packs.toggle_win()
end, {})
