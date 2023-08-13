local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local u = require("core/utils")

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.filename, 'react/index.d.ts') == nil
end

local function on_list(options)
  local items = options.items
  if #items > 1 then
    items = filter(items, filterReactDTS)
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  u.map("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  u.map("n", "<leader>ld", function() vim.lsp.buf.definition({on_list = on_list }) end, { buffer = 0 })
  u.map("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
  u.map("n", "<leader>s", vim.lsp.buf.signature_help, { buffer = 0 })
  u.map("n", "<leader>c", vim.lsp.buf.code_action, { buffer = 0 })
  u.map("n", "<leader>[", vim.diagnostic.goto_prev, { buffer = 0 })
  u.map("n", "<leader>]", vim.diagnostic.goto_next, { buffer = 0 })
  u.map("n", "<leader>a", vim.diagnostic.open_float, { buffer = 0 })
  u.map("n", "<leader>lf", vim.lsp.buf.references, { buffer = 0 })

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

for _, server in ipairs({
  "tsserver",
  "sumneko_lua",
  "gopls",
  "cssls",
  "clangd",
  "emmet_ls",
  "tailwindcss-language-server",
}) do
  require("lsp." .. server).setup(on_attach, capabilities)
end
