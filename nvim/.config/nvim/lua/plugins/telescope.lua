return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{
			"<leader>th",
			"<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>",
			desc = "Find files, including hidden files",
		},
		{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Grep in cwd" },
		{ "<leader>tu", "<cmd>Telescope buffers<cr>", desc = "List open buffers" },
		{ "<leader>tm", "<cmd>Telescope keymaps<cr>", desc = "List keymaps" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	opts = {
		defaults = {
			file_ignore_patterns = { "CMakeFiles" },
		},
	},
}
