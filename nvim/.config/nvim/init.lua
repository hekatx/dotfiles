--[[
    Neovim init

    Last modified: 17/02/2023
    By: éka
--]]

require("core/settings")

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
vim.g.maplocalleader = " "

local s = require("lazy").setup("plugins")

require("core/maps")
require("core/colors")

function doThing()
	-- Create a new vertical split window on the right
	vim.cmd("rightbelow vnew")

	-- Get the current buffer number
	local buf = vim.api.nvim_get_current_buf()

	-- Set the buffer name (optional)
	vim.api.nvim_buf_set_name(buf, "TaskOutput")

	-- Set the buffer type to "nofile" (optional)
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")

	-- Execute the `task` command and capture its output
	local output = vim.fn.systemlist("task")

	-- Set the contents of the buffer to the captured output
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)

	-- Set the buffer to be readonly (optional)
	vim.api.nvim_buf_set_option(buf, "readonly", true)
end

vim.api.nvim_create_user_command("Task", doThing, {})

return s
