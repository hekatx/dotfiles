return {
	-- Lsp related plugins
	"nvim-lua/plenary.nvim",

	-- Colorschemes
	"olivercederborg/poimandres.nvim",

	-- Motions and useful commands
	"tpope/vim-surround",
	"windwp/nvim-ts-autotag",
	"tpope/vim-abolish",
	"tpope/vim-fugitive",
	-- Misc
	"lewis6991/impatient.nvim",
	"kevinhwang91/nvim-bqf",
	{
		"rebelot/kanagawa.nvim",
		opts = {
			compile = true,
			background = { -- map the value of 'background' option to a theme
				dark = "dragon", -- try "dragon" !
				light = "dragon",
			},
		},
	},
	{
		"ms-jpq/coq.thirdparty",
		branch = "3p",
	},
}
