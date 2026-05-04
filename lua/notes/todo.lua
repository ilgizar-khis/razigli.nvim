local function read()
	local pwd = vim.fn.getcwd()
	local path = pwd .. "/.todo.json"
	local lines = {}
	if vim.fn.filereadable(path) == 1 then
		lines = vim.fn.readfile(path)
	else
		return {}
	end

	local text = table.concat(lines, "\n")

	local content = vim.json.decode(text)

	return content
end

local function write(data)
	local pwd = vim.fn.getcwd()
	local path = pwd .. "/.todo.json"
	local text = vim.json.encode(data)
	text = vim.fn.system("jq .", text)
	local lines = vim.split(text, "\n")
	vim.fn.writefile(lines, path)
end

local function update(mainPage)
	local data = read()
	local output = {}

	if data then
		for key, tbl in pairs(data) do
			local mark = "[" .. (tbl.done and "+" or " ") .. "]"
			table.insert(output, mark .. " " .. key)
			local lines = vim.split(tbl.content, "\n")
			for _, line in ipairs(lines) do
				table.insert(output, string.rep(" ", 4) .. line)
			end
		end
	else
		output = { "Empty" }
	end
	vim.api.nvim_buf_set_lines(mainPage, -1, -1, false, output)
end

local function add(win, mainPage)
	local addPage = vim.api.nvim_create_buf(false, true)

	local prompt = {
		"date: " .. os.date("%d %B %Y, %H:%M:%S"),
		"w = save",
		"q = quit",
		string.rep("_", 40),
		"",
	}

	vim.api.nvim_win_set_buf(win, addPage)

	vim.api.nvim_buf_set_lines(addPage, 0, -1, false, prompt)

	vim.api.nvim_win_set_cursor(win, { #prompt, 4 })

	vim.keymap.set("n", "w", function()
		local date = vim.api.nvim_buf_get_lines(addPage, 0, 1, false)[1]
		date = string.gsub(date, "^date: ", "")
		local lines = vim.api.nvim_buf_get_lines(addPage, #prompt - 1, -1, false)
		local text = table.concat(lines, "\n")
		local data = read()
		if data[date] then
			if data[date].content == text then
				print("Nothing up to date")
				return
			else
				print(date .. " note has been edited")
			end
		end
		data[date] = {
			content = text,
			done = false,
		}
		write(data)
	end, { buffer = addPage })

	vim.keymap.set("n", "q", function()
		vim.api.nvim_win_set_buf(win, mainPage)
		vim.api.nvim_buf_delete(addPage, {})
	end, { buffer = addPage })
end

local function edit(win, mainPage)
	local editPage = vim.api.nvim_create_buf(false, true)
	local lineNr = vim.api.nvim_win_get_cursor(win)[1]
	local lines = vim.api.nvim_buf_get_lines(mainPage, 0, -1, false)
	local output = {}

	local startPos, endPos = 0, 0
	for i = 0, #lines do
		if 0 < lineNr - i and lineNr - i < #lines then
			if string.find(lines[lineNr - i], "^%[") and startPos == 0 then
				startPos = lineNr - i
			end
		end

		if 0 < lineNr + i + 1 and lineNr + i + 1 < #lines then
			if string.find(lines[lineNr + i + 1], "^%[") and endPos == 0 then
				endPos = lineNr + i
			end
		end

		if startPos > 0 and endPos > 0 then
			print(startPos .. " : " .. endPos)
			break
		end

		if endPos == 0 then
			endPos = #lines
		end
	end

	for i = startPos, endPos do
		table.insert(output, lines[i])
	end

	local prompt = {
		"w = save",
		"q = quit",
	}

	vim.api.nvim_win_set_buf(win, editPage)

	vim.api.nvim_buf_set_lines(editPage, 0, -1, false, prompt)
	vim.api.nvim_buf_set_lines(editPage, -1, -1, false, output)
end

local function todo()
	local prompt = {
		"a = add new note",
		"e = edit not",
		"<Space> = toggle status",
		string.rep("_", 40),
		"",
	}
	local mainPage = vim.api.nvim_create_buf(false, true)

	local width = 160
	local height = 40
	local col = math.floor((vim.api.nvim_get_option("columns") - width) / 2)
	local row = math.floor((vim.api.nvim_get_option("lines") - height) / 2)
	local win = vim.api.nvim_open_win(mainPage, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		border = "single",
	})

	vim.api.nvim_win_set_option(win, "number", false)
	vim.api.nvim_win_set_option(win, "relativenumber", false)
	vim.api.nvim_win_set_option(win, "signcolumn", "no")

	-- add ToDoItem keymap
	vim.keymap.set("n", "a", function()
		add(win, mainPage)
	end, { buffer = mainPage })

	vim.keymap.set("n", "e", function()
		edit(win, mainPage)
	end, { buffer = mainPage })

	vim.api.nvim_buf_set_lines(mainPage, 0, -1, false, prompt)
	update(mainPage)
	vim.api.nvim_win_set_cursor(win, { #prompt + 1, 3 })
	vim.api.nvim_create_autocmd("CursorMoved", {
		callback = function()
			local buf = vim.api.nvim_get_current_buf()
			if buf == mainPage then
				local cur = vim.api.nvim_win_get_cursor(win)
				local curline, curcol = cur[1], cur[2]

				if curline == #prompt then
					-- local endLine = vim.api.nvim_buf_line_count(mainPage)
					vim.api.nvim_win_set_cursor(win, { #prompt + 1, 3 })
				end

				if curcol ~= 3 then
					vim.api.nvim_win_set_cursor(win, { curline, 3 })
				end
			end
		end,
	})
end

vim.api.nvim_create_user_command("ToDo", function()
	todo()
end, {})
