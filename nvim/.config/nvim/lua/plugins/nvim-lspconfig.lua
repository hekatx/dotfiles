local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local cmp_lsp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help, { buffer = 0 })
  vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set("n", "<leader>a", vim.diagnostic.open_float, { buffer = 0 })

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

lspconfig.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({})
    ts_utils.setup_client(client)
    on_attach(client)
  end,

  capabilities = cmp_lsp.update_capabilities(capabilities)
})

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettier,
  },
  on_attach = on_attach
})

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.gopls.setup {
  on_attach = on_attach
}

lspconfig.cssls.setup {
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.emmet_ls.setup {
  filetypes = {
    "html",
    "css",
    "jsx",
    "tsx"
  }
}

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
