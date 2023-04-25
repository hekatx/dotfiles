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
require("plugins/nvim-treesitter")
require("plugins/telescope")
require("plugins/dap/dap")
require("plugins/hop")
require("plugins/luasnip")

-- load lsp config
require("lsp")

vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#506477" })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "#506477" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#FFFAC2" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#FFFAC2" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#FFFAC2" })
vim.api.nvim_set_hl(0, "DiagnosticDefaultHint", { fg = "#FFFAC2" })
