local u = require("core/utils")

local M = {}

M.setup = function(on_attach, capabilities)
	require("typescript-tools").setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)

			u.buf_map(bufnr, "n", "<leader>mi", ":TSToolsAddMissingImports<CR>")
			u.buf_map(bufnr, "n", "gI", ":TypescriptRenameFile<CR>")

			u.buf_map(bufnr, "n", "gd", ":TSToolsGoToSourceDefinition<CR>")
		end,
		capabilities = capabilities,
	})
end

return M
