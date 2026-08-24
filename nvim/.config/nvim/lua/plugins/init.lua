return {
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-abolish", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = true,
	},
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		keys = {
			{ "<leader>ll", "<cmd>Oil<cr>", desc = "Open Oil" },
		},
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"dmmulroy/tsc.nvim",
		cmd = "TSC",
		config = true,
	},
	{
		"codethread/qmk.nvim",
		ft = { "dts", "keymap" },
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
		dir = vim.fn.expand("~/projects/neogit"),
		name = "neogit",
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"rest-nvim/rest.nvim",
		cmd = { "Rest", "Jpj" },
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("personal-plugins.jpj")
		end,
	},
	{ "tpope/vim-fugitive", cmd = "Git" },
	{
		"tpope/vim-dadbod",
		cmd = "DB",
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		ft = "sql",
		dependencies = { "tpope/vim-dadbod" },
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		cmd = "DBUI",
		dependencies = { "tpope/vim-dadbod" },
	},
	{
		"OXY2DEV/markview.nvim",
		ft = { "markdown", "norg" },
	},
	{ "nvim-mini/mini.statusline", version = false, config = true },
	{
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
		dependencies = { "MunifTanjim/nui.nvim" },
	},
	{
		"brenoprata10/nvim-highlight-colors",
		lazy = false,
		config = true,
	},
}
