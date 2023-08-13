require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver",
    "lua_ls",
    "gopls",
    "eslint_d",
    "lua_ls",
    "prettierd",
    "rome",
    "stylua",
    "tailwindcss",
  }
})
