local prompt = {
	"<Esc> = cancel",
	"<Cr> = confirm",
	"<Space> = toggle [+]/[ ]",
	"[+] = marked to delete",
}

local function clearPacks()
	local buffer = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_line(buffer, 0, -1, true, prompt)
end

vim.api.nvim_create_user_command("ClearPacks", function()
	clearPacks()
end, {})
