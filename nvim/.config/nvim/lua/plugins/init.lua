return {
	-- Lsp related plugins
	"nvim-lua/plenary.nvim",

	-- Colorschemes
	"olivercederborg/poimandres.nvim",

	-- Motions and useful commands
	"tpope/vim-surround",
	{
		"windwp/nvim-ts-autotag",
		opts = {
			filetypes = { "reason" },
		},
	},
	"tpope/vim-abolish",
	-- Misc
	"lewis6991/impatient.nvim",
	"kevinhwang91/nvim-bqf",
	{
		"rebelot/kanagawa.nvim",
		config = true,
	},
	{
		"ms-jpq/coq.thirdparty",
		branch = "3p",
	},
	"danielo515/nvim-treesitter-reason",
	{ "rescript-lang/vim-rescript", ft = "rescript" },
	"nvim-treesitter/playground",
	-- {
	-- 	"NeogitOrg/neogit",
	-- 	config = true,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- required
	-- 		"sindrets/diffview.nvim", -- optional - Diff integration
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 	},
	-- },
	{ "folke/neodev.nvim", opts = {} },
	{
		dir = "~/Projects/tw", -- Your path
		name = "tw",
		config = function()
			require("tw")
		end,
	},
	"MunifTanjim/nui.nvim",
	{
		"samjwill/nvim-unception",
		init = function()
			-- Optional settings go here!
			-- e.g.) vim.g.unception_open_buffer_in_new_tab = true
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ "rescript-lang/vim-rescript", ft = "rescript" },

	{
		dir = "~/Projects/neogit", -- Your path
		name = "neogit",
		config = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
	},
}
