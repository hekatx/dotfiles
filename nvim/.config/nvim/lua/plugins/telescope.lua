return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
    { 
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
    },
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"build",
					"CMakeFiles",
				},
				mappings = {
					n = {
						["<leader>c"] = "send_to_qflist",
						["<c-d>"] = "delete_buffer",
					},
				},
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("live_grep_args")
	end,
}
