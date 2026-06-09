vim.opt.completeopt = { "menuone", "noselect", "popup" }

local function trigger()
	if vim.fn.pumvisible() == 0 then
		vim.lsp.completion.get()
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})

			vim.api.nvim_create_autocmd("InsertCharPre", {
				buffer = args.buf,
				callback = function()
					vim.defer_fn(trigger, 100)
				end
			})
		end
	end
})
