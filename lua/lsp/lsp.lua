vim.pack.add({ "https://github.com/neovim/nvim-lspconfig.git" })

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
