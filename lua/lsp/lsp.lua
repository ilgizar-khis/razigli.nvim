vim.pack.add({ "https://github.com/neovim/nvim-lspconfig.git" })

vim.lsp.config("basedpyright", {
	root_markers = { ".venv", ".env", "pyproject.toml", "setup.py", "requirements.txt", ".git" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				typeCheckingMode = "strict",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

vim.lsp.enable("basedpyright")
