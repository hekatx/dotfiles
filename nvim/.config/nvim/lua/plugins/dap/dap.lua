local dap = require("dap")

require('plugins/dap/go')
require('plugins/dap/ui')
require('plugins/dap/cpp')

local js = require("plugins/dap/js")
dap.adapters.chrome = js.chrome
dap.configurations.javascriptreact = js.javascriptreact
dap.configurations.typescriptreact = js.typescriptreact

require("nvim-dap-virtual-text").setup({})
