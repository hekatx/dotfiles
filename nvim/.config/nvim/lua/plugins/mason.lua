return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup({
			ensure_installed = {
				"delve",
				"js-debug-adapter",
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"gopls",
				"lua_ls",
				"tailwindcss",
			},
		})
	end,
}
