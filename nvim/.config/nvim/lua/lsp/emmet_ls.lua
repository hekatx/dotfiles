local M = {}

M.setup = function()
  require 'lspconfig'.emmet_ls.setup {
    filetypes = {
      "html",
      "css",
      "jsx",
      "tsx"
    }
  }
end

return M
