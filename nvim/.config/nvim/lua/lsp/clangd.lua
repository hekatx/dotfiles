local u = require("core/utils")
local M = {}

M.setup = function(on_attach, capabilities)
  require 'lspconfig'.clangd.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      u.map("n", "<leader>,", "<cmd>ClangdSwitchSourceHeader<cr>", { buffer = 0 })
    end,
    capabilities = capabilities,
  }
end

return M
