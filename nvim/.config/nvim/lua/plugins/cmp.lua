local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"rafamadriz/friendly-snippets",
	},
}

M.config = function()
	local cmp = require("cmp")
	cmp.setup({
		completion = {
			autocomplete = false,
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-space>"] = cmp.mapping({
				i = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
			}),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<C-l>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "luasnip" },
			{ name = "nvim_lua" },
			{ name = "nvim_lsp" },
			{ name = "path" },
		}),
	})
end

return M
