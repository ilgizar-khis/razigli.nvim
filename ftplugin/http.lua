vim.keymap.set("n", "<CR>", function()
	local changed = false
	if not vim.opt_local.splitright:get() then
		vim.opt_local.splitright = true
		changed = true
	end
	vim.cmd("Rest run")
	if changed then
		vim.opt_local.splitright = false
	end
end, {
	buffer = 0,
	desc = "запуск Rest run из ftplugin",
})

--- @param lines table<string>
--- @param start_number number
--- @param end_number number
--- @return number | nil
local function find_header(lines, start_number, end_number)
	for i = start_number, end_number do
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
