-- :h lsp-config

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(ev)
		local opts = { buffer = ev.buf, noremap = true, silent = true }
		local map = vim.keymap.set

		map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, {
			desc = "Go to declaration",
		}))
		map("n", "<leader>ld", vim.lsp.buf.definition, vim.tbl_extend("force", opts, {
			desc = "Go to definition",
		}))
		map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, {
			desc = "Show hover documentation",
		}))
		map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, {
			desc = "Go to implementation",
		}))
		map("n", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, {
			desc = "Show signature help",
		}))
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, {
			desc = "Add workspace folder",
		}))
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, {
			desc = "Remove workspace folder",
		}))
		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, vim.tbl_extend("force", opts, {
			desc = "List workspace folders",
		}))
		map("n", "<leader>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, {
			desc = "Go to type definition",
		}))
		map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
			desc = "Rename symbol",
		}))
		map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {
			desc = "Code action",
		}))
		map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, {
			desc = "List references",
		}))
		map("n", "<leader>f", vim.lsp.buf.format, vim.tbl_extend("force", opts, {
			desc = "Format buffer",
		}))
	end,
})

-- Enable configured language servers.
vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("tailwindcss-language-server")
vim.lsp.enable("cssls")
vim.lsp.enable("qml")
