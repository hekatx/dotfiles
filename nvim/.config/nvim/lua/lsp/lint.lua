local lint = require("lint")
local formatter = require("formatter")
local fts = require("formatter.filetypes")

lint.linters_by_ft = {
  markdown = {'vale' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
}

formatter.setup({
  logging = true,
  filetype = {
		javascript = { fts.typescriptreact.eslint_d, fts.typescriptreact.prettierd },
		javascriptreact = { fts.typescriptreact.eslint_d, fts.typescriptreact.prettierd },
		typescript = { fts.typescriptreact.eslint_d, fts.typescriptreact.prettierd },
		typescriptreact = { fts.typescriptreact.eslint_d, fts.typescriptreact.prettierd },
		json = { require("formatter.filetypes.json").prettier },
  }
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    vim.cmd.FormatWrite()
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

