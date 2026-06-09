vim.opt.completeopt = { "menu", "noselect", "popup" }

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})

			vim.api.nvim_create_autocmd("InsertCharPre", {
				buffer = args.buf,
				callback = function()
					if vim.fn.pumvisible == 0 then
						vim.defer_fn(vim.lsp.completion.get, 100)
					end
				end
			})
		end
	end
})
