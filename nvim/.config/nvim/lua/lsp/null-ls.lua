local null_ls = require("null-ls")
local b = null_ls.builtins

local biome = b.formatting.rome.with({
	command = "biome",
})

local M = {}

M.setup = function(on_attach)
	null_ls.setup({
		sources = {
			-- JS/TS
			--b.formatting.prettierd.with({ extra_filetypes = { "astro" } }),
			-- b.formatting.eslint_d.with({ extra_filetypes = { "astro" } }),
			-- b.diagnostics.eslint_d.with({ extra_filetypes = { "astro" } }),
			biome,

			-- lua
			b.formatting.stylua,
		},
		on_attach = on_attach,
	})
end

return M
