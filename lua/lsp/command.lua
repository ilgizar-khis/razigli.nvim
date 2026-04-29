vim.api.nvim_create_user_command("LspDiagnostic", function()
	vim.diagnostic.open_float()
end)
