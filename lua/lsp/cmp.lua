vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp.git",
		version = "v1",
	}
})

local BlinkCmp = require("blink.cmp")
-- BlinkCmp.build():wait(60000)
BlinkCmp.setup({
	keymap = {
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
	},
	signature = {
		enabled = true,
		window = {
			show_documentation = true,
		},
	},

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono',
    },

    completion = {
      accept = {
        auto_brackets = { enabled = true, },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})
