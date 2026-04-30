local prompt = {
	"<Esc> = cancel",
	"<Cr> = confirm",
	"<Space> = toggle [+]/[ ]",
	"[+] = marked to delete",
	"",
}

local function update(buffer)
	local packs = {}
	-- get all plugins
	for _, pack in ipairs(vim.pack.get()) do
		-- if plugin disabled we add he to list
		if not pack.active then
			table.insert(packs, "[+] " .. pack.spec.name)
			table.insert(packs, "\tsrc = " .. pack.spec.src)
		end
	end
	vim.api.nvim_buf_set_lines(buffer, #prompt, -1, true, packs)
end

local function clearPacks()
	-- create buffer and write prompt
	local buffer = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buffer, 0, -1, true, prompt)
	-- create window
	local width = 100
	local height = 30
	local col = math.floor((vim.api.nvim_get_option("columns") - width) / 2)
	local row = math.floor((vim.api.nvim_get_option("lines") - height) / 2)
	local win = vim.api.nvim_open_win(buffer, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		border = "single",
	})
	-- set options
	vim.api.nvim_win_set_option(win, "number", false)
	vim.api.nvim_win_set_option(win, "relativenumber", false)

	update(buffer)
end

vim.api.nvim_create_user_command("ClearPacks", function()
	clearPacks()
end, {})
