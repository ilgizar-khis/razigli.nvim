local prompt = {
	"<Esc> = cancel",
	"<Cr> = confirm",
	"<Space> = toggle [+]/[ ]",
	"<S-u> = update",
	"[+] = marked to delete",
	"",
}

local function update(win, buffer)
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
	print("plugin list updated")
	vim.api.nvim_win_set_cursor(win, { #prompt + 1, 3 })
end

local function move(win, buffer, way)
	local lineNr = vim.api.nvim_win_get_cursor(win)[1]
	local relLineNr = lineNr - #prompt
	local target = 0
	if lineNr > #prompt then
		if way == "prev" then
			if relLineNr == 1 then
				target = vim.api.nvim_buf_line_count(buffer) - 1
			else
				target = lineNr - 1 - relLineNr % 2
			end
		elseif way == "next" then
			if lineNr > vim.api.nvim_buf_line_count(buffer) - 2 then
				target = #prompt + 1
			else
				target = lineNr + 1 + relLineNr % 2
			end
		elseif way == "start" then
			target = #prompt + 1
		elseif way == "end" then
			target = vim.api.nvim_buf_line_count(buffer) - 1
		elseif way == "up" then
			if relLineNr == 1 then
				target = vim.api.nvim_buf_line_count(buffer)
			else
				target = lineNr - 1
			end
		elseif way == "down" then
			if lineNr == vim.api.nvim_buf_line_count(buffer) then
				target = #prompt + 1
			else
				target = lineNr + 1
			end
		end
		vim.api.nvim_win_set_cursor(win, { target, 3 })
	end
end

local function cancel(win)
	vim.api.nvim_win_close(win, true)
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
				line, _ = string.gsub(line, "^%[%+%]", "[ ]")
			elseif string.find(line, "^%[ %]") then
				line, _ = string.gsub(line, "^%[ %]", "[+]")
			end
			print(line)
			vim.api.nvim_buf_set_lines(buffer, lineNr - 1, lineNr, false, { line })
		end
	end
end

local function confirm(win, buffer)
	local packs = vim.api.nvim_buf_get_lines(buffer, #prompt, -1, false)
	local markedPacks = {}
	for _, line in ipairs(packs) do
		if string.find(line, "^%[%+%]") then
			local name, _ = string.gsub(line, "^%[%+%] ", "")
			table.insert(markedPacks, name)
		end
	end

	vim.pack.del(markedPacks)

	update(win, buffer)
end

local function clearPacks()
	-- create buffer and write prompt
	local buffer = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buffer, 0, -1, true, prompt)
	-- create window
	local width = 160
	local height = 40
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

	update(win, buffer)

	-- toggle keymap
	vim.keymap.set("n", "<Space>", function()
		toggle(win, buffer)
	end, { buffer = buffer, noremap = true, silent = true })
	-- cancel keymap
	vim.keymap.set("n", "<Esc>", function()
		cancel(win)
	end, { buffer = buffer, noremap = true, silent = true })
	vim.keymap.set("n", "q", function()
		cancel(win)
	end, { buffer = buffer, noremap = true, silent = true })
	-- update keymap
	vim.keymap.set("n", "<S-u>", function()
		update(win, buffer)
	end, { buffer = buffer, noremap = true, silent = true })
	-- jump keymap
	vim.keymap.set("n", "<Tab>", function()
		move(win, buffer, "next")
	end, { buffer = buffer, noremap = true, silent = true })
	vim.keymap.set("n", "<S-Tab>", function()
		move(win, buffer, "prev")
	end, { buffer = buffer, noremap = true, silent = true })
	vim.keymap.set("n", "gg", function()
		move(win, buffer, "start")
	end, { buffer = buffer, noremap = true, silent = true })
	vim.keymap.set("n", "G", function()
		move(win, buffer, "end")
	end, { buffer = buffer, noremap = true, silent = true })
	vim.keymap.set("n", "k", function()
		move(win, buffer, "up")
	end, { buffer = buffer, noremap = true, silent = true })
	vim.keymap.set("n", "j", function()
		move(win, buffer, "down")
	end, { buffer = buffer, noremap = true, silent = true })
	-- confirm keymap
	vim.keymap.set("n", "<CR>", function()
		confirm(win, buffer)
	end, { buffer = buffer, noremap = true, silent = true })
end

vim.api.nvim_create_user_command("ClearPacks", function()
	clearPacks()
end, {})
