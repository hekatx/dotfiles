return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
		highlight = { enable = true },
	},
}
