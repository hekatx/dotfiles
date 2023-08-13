--[[
    Neovim init

    Last modified: 17/02/2023
    By: éka
--]]
-- load packer and all plugins installed
require("packer_init")

-- load core configs
require("core/settings")
require("core/maps")
require("core/colors")

-- load plugins config files
require("plugins/mason")
require("plugins/cmp")
-- require("plugins/coq")
require("plugins/nvim-treesitter")
require("plugins/telescope")
require("plugins/dap/dap")
require("plugins/hop")
require("plugins/luasnip")
require("plugins/neotest")

-- load lsp config
require("lsp")
require("lsp/lint")

