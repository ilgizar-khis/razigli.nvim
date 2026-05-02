local function update(buf)
	local pwd = vim.fn.getcwd()
	local path = pwd .. "/.todo.json"

	local text = {
		{
			date = os.date("%d %B %Y, %H:%M:%S"),
			content = "first init",
			done = true,
			deadline = 0,
		},
	}
	if vim.fn.filereadable(path) == 1 then
		text = vim.fn.readfile(path)
	else
		local json = vim.json.encode(text)
		local prettyJson = vim.fn.system("jq .", json)
		local content = vim.split(prettyJson, "\n")
		vim.fn.writefile(content, path)
	end

	local content = table.concat(text, "\n")
	local json = vim.json.decode(content)
	local output = {}
	for _, tbl in ipairs(json) do
		local mark = "[" .. (tbl.done and "+" or " ") .. "]"
		table.insert(output, mark .. " date = " .. tbl.date)
		table.insert(output, "\tcontent = " .. tbl.content)
		table.insert(output, "\tdeadline = " .. tbl.deadline)
	end
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
end

local function todo()
	local buf = vim.api.nvim_create_buf(false, true)

	local width = 160
	local height = 40
	local col = math.floor((vim.api.nvim_get_option("columns") - width) / 2)
	local row = math.floor((vim.api.nvim_get_option("lines") - height) / 2)
	local win = vim.api.nvim_open_win(buf, true, {
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

	update(buf)
end

vim.api.nvim_create_user_command("ToDo", function()
	todo()
end, {})
