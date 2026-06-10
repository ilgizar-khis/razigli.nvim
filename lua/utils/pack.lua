vim.pack.add({
	{
		src = "https://github.com/ilgizar-khis/packs.razigli.git",
		version = "dev",
	},
})

local packs = require("packs.razigli")
packs.setup()

vim.api.nvim_create_user_command("Packs", function()
	packs.toggle_win()
end, {})
