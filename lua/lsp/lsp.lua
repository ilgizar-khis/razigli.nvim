vim.pack.add({ "https://github.com/neovim/nvim-lspconfig.git" })

vim.lsp.config("pyright", {
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

vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "X",
			[vim.diagnostic.severity.WARN] = "!",
			[vim.diagnostic.severity.HINT] = "?",
			[vim.diagnostic.severity.INFO] = "I",
		},
	},
})

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ffabab" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ffffab" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#ababff" })
