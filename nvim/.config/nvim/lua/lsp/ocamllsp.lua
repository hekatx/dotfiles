local lsp = require("lspconfig")
local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").ocamllsp.setup({
		cmd = { "ocamllsp" },
		filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
		root_dir = lsp.util.root_pattern(
			"*.opam",
			"esy.json",
			"package.json",
			".git",
			"dune-project",
			"dune-workspace"
		),
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
