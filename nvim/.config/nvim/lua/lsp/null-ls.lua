local null_ls = require("null-ls")
local b = null_ls.bultins

local file_exists = function(file)
	local f = io.open(file, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local getDefaultEslintConfig = function(params)
	local file_types = { "js", "cjs", "yaml", "yml", "json" }
	for _, file_type in pairs(file_types) do
		if file_exists(params.root .. "/.eslintrc." .. file_type) then
			return {}
		end
	end

	return {
		"--config",
		vim.fn.expand("~/.eslintrc.json"),
	}
end

local M = {}

M.setup = function(on_attach)
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.eslint_d.with({
				extra_args = getDefaultEslintConfig,
			}),
			-- null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.jq,
			null_ls.builtins.formatting.stylua,
			-- null_ls.builtins.formatting.rome.with({ command = "biome" }),
		},
		on_attach = on_attach,
		debug = true,
		diagnostics_format = "#{m} (#{s}) ([#{c}])",
	})
end

return M
