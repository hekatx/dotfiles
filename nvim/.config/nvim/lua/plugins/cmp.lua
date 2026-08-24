return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"windwp/nvim-autopairs",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
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
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-l>"] = cmp.mapping(function()
					local luasnip = require("luasnip")
					if luasnip.choice_active() then
						luasnip.change_choice(1)
					else
						cmp.confirm({ select = true })
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "lazydev", group_index = 0 },
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "path" },
			}),
		})

		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
			},
		})
	end,
}
