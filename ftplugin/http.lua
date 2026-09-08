local kulala = require("kulala")

vim.keymap.set("n", "<S-CR>", kulala.run, { buffer = 0 })

--- @param lines table<string>
--- @param start_number number
--- @param end_number number
--- @param prev? boolean
--- @return number | nil
local function find_header(lines, start_number, end_number, prev)
	local step = prev and -1 or 1
	for i = start_number, end_number, step do
		local line = lines[i]
		if string.find(line, "^###") then
			return i
		end
	end
end

vim.keymap.set("n", "J", function()
	local line_nr = vim.api.nvim_win_get_cursor(0)[1]
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local i = find_header(lines, line_nr + 1, #lines) or find_header(lines, 1, line_nr)
	vim.api.nvim_win_set_cursor(0, { i or 1, 0 })
end)

vim.keymap.set("n", "K", function()
	local line_nr = vim.api.nvim_win_get_cursor(0)[1]
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local i = find_header(lines, line_nr - 1, 1, true) or find_header(lines, #lines, line_nr, true)
	vim.api.nvim_win_set_cursor(0, { i or 1, 0 })
end)
