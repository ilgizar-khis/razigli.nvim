vim.opt.completeopt = { "menuone", "noselect" }

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

			-- length of showed items
			vim.opt.pumheight = 10
			-- basic HL to popup menu
			vim.api.nvim_set_hl(0, "Pmenu", { fg = "#ffffff", bg = "#343434" })
			-- basic HL to popup menu selected
			vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#ffffff", bg = "#565656", bold = true })
			-- border HL
			vim.api.nvim_set_hl(0, "PmenuBorder", { bg = "#343434" })
			-- thumb of scrollbar
			vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#565656" })
			-- HL of symbol type
			vim.api.nvim_set_hl(0, "PmenuKind", { fg = "#ff8989", bg = "#343434" })
			vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = "#ff8989", bg = "#565656", bold = true })
			-- HL of extra
			vim.api.nvim_set_hl(0, "PmenuExtra", { fg = "#aaaaff", bg = "#343434" })
			vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = "#aaaaff", bg = "#565656", bold = true })
			-- enable completion
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

			-- manual trigger of completion
			vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, { buffer = args.buf })
			-- to next
			vim.keymap.set("i", "<Tab>", function()
				return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
			end, { buffer = args.buf, expr = true })
			-- to prev
			vim.keymap.set("i", "<S-Tab>", function()
				return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
			end, { buffer = args.buf, expr = true })
			-- select current item
			vim.keymap.set("i", "<CR>", function()
				if vim.fn.pumvisible() == 1 then
					return "<C-y>"
				else
					return "<CR>"
				end
			end, { buffer = args.buf, expr = true })
		end
	end
})
