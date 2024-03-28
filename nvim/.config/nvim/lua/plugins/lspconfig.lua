return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim",
		"nvim-lua/plenary.nvim",
		"jose-elias-alvarez/typescript.nvim",
		"simrat39/rust-tools.nvim",
	},

	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local u = require("core/utils")

		-- Set up lspconfig.
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			u.map("n", "K", vim.lsp.buf.hover, { buffer = 0 })
			u.map("n", "<leader>ld", vim.lsp.buf.definition, { buffer = 0 })
			u.map("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
			u.map("n", "<leader>s", vim.lsp.buf.signature_help, { buffer = 0 })
			u.map("n", "<leader>c", vim.lsp.buf.code_action, { buffer = 0 })
			u.map("n", "<leader>[", vim.diagnostic.goto_prev, { buffer = 0 })
			u.map("n", "<leader>]", vim.diagnostic.goto_next, { buffer = 0 })
			u.map("n", "<leader>a", vim.diagnostic.open_float, { buffer = 0 })
			u.map("n", "<leader>lf", vim.lsp.buf.references, { buffer = 0 })

			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end

		require("lspconfig").rescriptls.setup({})

		for _, server in ipairs({
			"tsserver",
			"null-ls",
			"sumneko_lua",
			"gopls",
			"cssls",
			"clangd",
			"emmet_ls",
			"rust-analyzer",
			"tailwindcss-language-server",
			"ocamllsp",
		}) do
			require("lsp." .. server).setup(on_attach)
		end
	end,
}
