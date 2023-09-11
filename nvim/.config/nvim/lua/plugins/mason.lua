local M = {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
}

M.config = function()
	require("mason").setup({
		ensure_installed = {
			"js-debug-adapter",
			"delve",
			"eslint_d",
			"prettierd",
			"biome",
			"stylua",
			"rust-analyzer",
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = {
			"tsserver",
			"lua_ls",
			"gopls",
			"lua_ls",
			"clangd",
			"tailwindcss",
		},
	})
end

return M
