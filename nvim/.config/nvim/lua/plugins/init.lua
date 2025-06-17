return {
	-- Lsp related plugins
	"nvim-lua/plenary.nvim",

	-- Motions and useful commands
	"tpope/vim-surround",
	-- Misc
	"kevinhwang91/nvim-bqf",
	{
		"junegunn/fzf",
	},

	{ "ibhagwan/fzf-lua" },
	"tpope/vim-fugitive",
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
	},
	{
		"seblj/roslyn.nvim",
		ft = "cs",
	},
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-completion",
	"kristijanhusak/vim-dadbod-ui",
}
