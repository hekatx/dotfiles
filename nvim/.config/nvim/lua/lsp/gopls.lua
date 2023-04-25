local M = {}

M.setup = function(on_attach)
  require 'lspconfig'.gopls.setup {
    on_attach = on_attach,
    usePlaceholder = true
  }
end

return M
