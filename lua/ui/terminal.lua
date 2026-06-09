local M = {
	buffer = nil,
}
vim.api.nvim_create_user_command("Terminal", function()
	local buffer = vim.api.nvim_create_buf(false, true)
	if M.buffer and vim.api.nvim_buf_is_valid(M.buffer) then
		buffer = M.buffer
	end

	local width = 160
	local height = 40
	local col = math.floor((vim.api.nvim_get_option("columns") - width) / 2)
	local row = math.floor((vim.api.nvim_get_option("lines") - height) / 2)

	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "single",
	}

	local win = vim.api.nvim_open_win(buffer, true, opts)

	if not M.buffer or not vim.api.nvim_buf_is_valid(M.buffer) then
		vim.cmd("term")
		M.buffer = vim.api.nvim_win_get_buf(win)
	end
	
end, {})
return M
