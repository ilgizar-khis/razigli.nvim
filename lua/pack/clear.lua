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

local function toggle(win, buffer)
	-- get current line number
	local lineNr = vim.api.nvim_win_get_cursor(win)[1]
	-- check in/out field
	if lineNr > #prompt then
		-- if current relative line number is even,
		-- then we clicked on the title,
		-- else we need go to .-1
		if (lineNr - #prompt) % 2 == 0 then
			lineNr = lineNr - 1
		end
		-- get current line
		local line = vim.api.nvim_buf_get_lines(buffer, lineNr - 1, lineNr, false)[1]
		if line ~= nil then
			if string.find(line, "^%[%+%]") then
				line, _ = string.gsub(line, "%[%+%]", "[ ]")
			elseif string.find(line, "^%[ %]") then
				line, _ = string.gsub(line, "%[% %]", "[+]")
			end
			print(line)
			vim.api.nvim_buf_set_lines(buffer, lineNr - 1, lineNr, false, { line })
		end
	end
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

	vim.keymap.set("n", "<Space>", function()
		toggle(win, buffer)
	end, { buffer = buffer, noremap = true, silent = true })
end

vim.api.nvim_create_user_command("ClearPacks", function()
	clearPacks()
end, {})
