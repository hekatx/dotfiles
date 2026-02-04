local js_conform_formatters = {
	"biome",
	"eslint_d",
	"eslint",
	stop_after_first = true,
}
return {
	-- Lsp related plugins
	"nvim-lua/plenary.nvim",

	-- Motions and useful commands
	"tpope/vim-surround",
	"tpope/vim-abolish",

	-- Misc
	"kevinhwang91/nvim-bqf",
	{
		"rebelot/kanagawa.nvim",
		config = true,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"dmmulroy/tsc.nvim",
		config = true,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
	},
	{
		"codethread/qmk.nvim",
		config = function()
			require("qmk").setup({
				name = "totem",
				variant = "zmk",
				layout = {
					"_ x x x x x _ x x x x x _",
					"_ x x x x x _ x x x x x _",
					"x x x x x x _ x x x x x x",
					"_ _ _ x x x _ x x x _ _ _",
				},
			})
		end,
	},
	{
		"junegunn/fzf",
	},
	{
		dir = "~/projects/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"nvzone/volt",
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = js_conform_formatters,
				javascriptreact = js_conform_formatters,
				typescript = js_conform_formatters,
				typescriptreact = js_conform_formatters,
			},

			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	"tpope/vim-fugitive",
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-completion",
	"kristijanhusak/vim-dadbod-ui",
	"webhooked/kanso.nvim",
	{
		"brianhuster/unnest.nvim",
		lazy = false,
	},
	{ "windwp/nvim-ts-autotag", opts = {} },

	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		-- Completion for `blink.cmp`
		-- dependencies = { "saghen/blink.cmp" },
	},

	"rest-nvim/rest.nvim",
	"nvim-neotest/nvim-nio",
	{ "nvim-mini/mini.statusline", version = false, config = true },
	{ "nvim-mini/mini-git", version = false },

	{ "nvim-mini/mini.diff", version = false },
	{
		"esmuellert/codediff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
	},
}
