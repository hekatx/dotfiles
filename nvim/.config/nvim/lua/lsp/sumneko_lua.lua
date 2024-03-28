local M = {}

M.setup = function(on_attach)
	require("lspconfig").lua_ls.setup({
		on_attach = function(client, buffer)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			on_attach(client, buffer)
		end,
		settings = {
			Lua = {
				format = {
					enable = false,
				},
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = { vim.api.nvim_get_runtime_file("", true) },
					checkThirdParty = true,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

return M
