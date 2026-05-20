--[[
    Neovim init

    Last modified: 17/02/2023
    By: éka
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("core/settings")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local s = require("lazy").setup("plugins")

require("core/maps")
require("core/colors")
require("core/lsp")
require("personal-plugins/jpj")
require("personal-plugins/qfsave")

return s
