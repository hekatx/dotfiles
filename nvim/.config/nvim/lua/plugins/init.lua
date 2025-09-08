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
	"nvim-treesitter/playground",
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
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
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
				javascript = { "biome", "eslint", stop_after_first = true },
				javascriptreact = { "biome", "eslint", stop_after_first = true },
				typescript = { "biome", "eslint", stop_after_first = true },
				typescriptreact = { "biome", "eslint", stop_after_first = true },
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
    lazy = false
  }
}
