return {
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
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-neotest/nvim-nio",
			"nvim-neorg/lua-utils.nvim",
			"nvim-lua/plenary.nvim",
			"pysan3/pathlib.nvim",
		},
	},
	-- Lsp related plugins
	"nvim-lua/plenary.nvim",
	"jose-elias-alvarez/typescript.nvim",

	-- Colorschemes
	"olivercederborg/poimandres.nvim",

	-- Motions and useful commands
	"tpope/vim-surround",
	"windwp/nvim-ts-autotag",
	"tpope/vim-abolish",
	-- Misc
	"kevinhwang91/nvim-bqf",
	{
		"rebelot/kanagawa.nvim",
		opts = {
			background = {
				dark = "dragon",
				light = "dragon",
			},
		},
	},
	{
		"ms-jpq/coq.thirdparty",
		branch = "3p",
	},
	{
		"junegunn/fzf",
	},
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup()
		end,
	},
	"tpope/vim-fugitive",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			delay = 800,
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
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
	"nyoom-engineering/oxocarbon.nvim",
	{
		"seblj/roslyn.nvim",
		ft = "cs",
	},
	"dhruvasagar/vim-table-mode",
	{
		"hat0uma/csvview.nvim",
		config = function()
			require("csvview").setup()
		end,
	},
	{
		"https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git",
		-- Activate when a file is created/opened
		event = { "BufReadPre", "BufNewFile" },
		-- Activate when a supported filetype is open
		ft = { "go", "javascript", "python", "ruby", "javascriptreact", "typescriptreact", "typescript" },
		cond = function()
			-- Only activate if token is present in environment variable.
			-- Remove this line to use the interactive workflow.
			return false
		end,
		opts = {
			statusline = {
				-- Hook into the built-in statusline to indicate the status
				-- of the GitLab Duo Code Suggestions integration
				enabled = true,
			},
			code_suggestions = {
				ghost_text = {
					enabled = true,
					toggle_enabled = "<C-h>",
					accept_suggestion = "<C-l>",
					clear_suggestion = "<C-l>",
					stream = true,
				},
			},
		},
	},
	{
		"kawre/leetcode.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- "ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			-- configuration goes here
		},
	},
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-completion",
	"kristijanhusak/vim-dadbod-ui",
}
