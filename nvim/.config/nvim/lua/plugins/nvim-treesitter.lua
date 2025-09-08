return {
	lazy = false,
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
      auto_install = true,
			sync_install = false,
			autotag = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"tsx",
				"html",
				"scss",
				"typescript",
				"javascript",
				"json",
				"yaml",
				"go",
				"cpp",
				"lua",
				"rust",
				"markdown",
			},
			ignore_install = {},
			modules = {},
		})
		vim.filetype.add({
			extension = {
				mdx = "mdx",
			},
		})
	end,
}
