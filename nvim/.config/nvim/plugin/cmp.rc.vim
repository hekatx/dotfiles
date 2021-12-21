lua <<EOF
-- Completion config with cmp

local cmp = require'cmp'
local configs = require'lspconfig.configs'

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  };

  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },

  sources = {
    { name = 'ultisnips' },
    { name = "path"},
    { name = "nvim_lsp"},
  },
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require('lspconfig')

lspconfig.ccls.setup {
  capabilities = capabilities,
}

lspconfig.tsserver.setup({
  capabilities = capabilities,
})

EOF
