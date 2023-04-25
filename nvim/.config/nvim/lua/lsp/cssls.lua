local M = {}

M.setup = function(_, capabilities)
  require 'lspconfig'.cssls.setup {
    capabilities = capabilities,
  }
end

return M
