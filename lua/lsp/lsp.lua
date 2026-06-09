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

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.enable("basedpyright")
vim.lsp.enable("lua_ls")
