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
local parsers = require("nvim-treesitter.parsers")

local journalPath = "/home/quebin_gonzalez/notes/personal/journal/"

local insertUndoneTodosInCurrentBuffer = function()
	local queryString = [[ (_
  state: (detached_modifier_extension [
    (todo_item_undone)
    (todo_item_pending)
  ]) 
  content: (paragraph) 
) @something
  ]]

	local todosInProgress = { "* Past TODOs" }

	local paths = vim.split(vim.fn.glob(journalPath .. "**/*.norg"), "\n")
	local todaysName = vim.api.nvim_buf_get_name(0)

	for _, path in pairs(paths) do
		if path ~= todaysName then
			local bufnr = vim.api.nvim_create_buf(true, false)
			vim.api.nvim_buf_set_name(bufnr, path)
			vim.api.nvim_buf_call(bufnr, vim.cmd.edit)
			local parser = parsers.get_parser(bufnr)
			local tree = parser:parse()[1]
			local root = tree:root()
			local lang = parser:lang()
			local query = vim.treesitter.query.parse(lang, queryString)

			for _, matches, _ in query:iter_matches(root, 0) do
				table.insert(todosInProgress, vim.treesitter.get_node_text(matches[1], bufnr))
			end
			vim.api.nvim_buf_delete(bufnr, {})
		end
	end

	local todaysBuffer = 0

	vim.api.nvim_buf_set_lines(todaysBuffer, 0, 0, false, todosInProgress)
end

vim.api.nvim_create_user_command("InsertTodos", insertUndoneTodosInCurrentBuffer, {})

return s
