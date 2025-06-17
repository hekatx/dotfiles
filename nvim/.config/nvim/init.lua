--[[
    Neovim init

    By: éka
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local s = require("lazy").setup("plugins", {
	rocks = {
		hererocks = true,
	},
	git = {
		timeout = 10000000,
	},
})

require("core/settings")
require("core/maps")
require("core/colors")

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	callback = function()
		vim.cmd("sleep 50m")
	end,
})

return s
