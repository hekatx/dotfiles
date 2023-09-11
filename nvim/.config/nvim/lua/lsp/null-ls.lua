local null_ls = require("null-ls")
local b = null_ls.builtins

local M = {}

M.setup = function(on_attach)
  null_ls.setup({
      sources = {
          -- JS/TS
          b.formatting.prettierd,
          b.formatting.eslint_d,
          b.diagnostics.eslint_d,
          b.formatting.stylua,
      },
      on_attach = on_attach,
      debug = true,
      diagnostics_format = "#{m} (#{s}) ([#{c}])",
  })
end

return M
