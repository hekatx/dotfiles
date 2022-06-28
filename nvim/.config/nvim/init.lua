--[[
    Neovim init
    Last modified: 10/03/2022
    By: éka
--]]

-- load packer and all plugins installed
require('packer_init')

-- load core configs
require('core/settings')
require('core/maps')
require('core/colors')

-- load plugins config files
require('plugins/cmp')
require('plugins/nvim-treesitter')
require('plugins/nvim-lspconfig')
require('plugins/telescope')
require('plugins/feline')
require('plugins/dap/dap')
require('plugins/hop')
