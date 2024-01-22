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
    config = function ()
    end
  },
	{
		"ms-jpq/coq.thirdparty",
		branch = "3p",
	},
}
