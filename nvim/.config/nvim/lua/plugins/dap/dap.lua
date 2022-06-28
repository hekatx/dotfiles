require('plugins/dap/nvim-dap_go')
require('plugins/dap/nvim-dap_ui')
require("nvim-dap-virtual-text").setup()

local dap = require("dap")
local js = require("plugins/dap/nvim-dap_js")

dap.adapters.chrome = js.chrome
dap.configurations.javascriptreact = js.javascriptreact
dap.configurations.typescriptreact = js.typescriptreact
