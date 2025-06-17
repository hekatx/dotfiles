local u = require("core/utils")

local M = {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
				ensure_installed = {
					"js-debug-adapter",
					"delve",
					"eslint_d",
					"prettierd",
					"biome",
					"stylua",
					"rust-analyzer",
					"gopls",
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			config = {
				on_attach = function(client, bufnr)
					u.map("n", "K", vim.lsp.buf.hover, { buffer = 0 })
					u.map("n", "<leader>ld", vim.lsp.buf.definition, { buffer = 0 })
					u.map("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
					u.map("n", "<leader>s", vim.lsp.buf.signature_help, { buffer = 0 })
					u.map("n", "<leader>c", vim.lsp.buf.code_action, { buffer = 0 })
					u.map("n", "<leader>[", vim.diagnostic.goto_prev, { buffer = 0 })
					u.map("n", "<leader>]", vim.diagnostic.goto_next, { buffer = 0 })
					u.map("n", "<leader>a", vim.diagnostic.open_float, { buffer = 0 })
					u.map("n", "<leader>lf", vim.lsp.buf.references, { buffer = 0 })
				end,
			},
		},
	},
}

return M
