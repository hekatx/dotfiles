return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"kyazdani42/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
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
			},
		})

		telescope.load_extension("file_browser")
	end,
}
