vim.api.nvim_create_user_command("LspDiagnostic", function()
	vim.diagnostic.open_float()
end, {})

vim.api.nvim_create_user_command("LspLog", function()
	local buffer = vim.api.nvim_create_buf(false, true)
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

	vim.api.nvim_win_set_option(win, "number", false)
	vim.api.nvim_win_set_option(win, "relativenumber", false)

	local home = os.getenv("HOME")
	local log = vim.fn.readfile(home .. "/.local/state/nvim/lsp.log")
	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, log)
	vim.api.nvim_buf_set_option(buffer, "readonly", true)
	vim.api.nvim_buf_set_option(buffer, "modifiable", false)
	vim.cmd.normal("G")
end, {})
