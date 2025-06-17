vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "NeotestRunning", { fg = "#EDC77A" })
		vim.api.nvim_set_hl(0, "NeotestPassed", { fg = "#7FBCB4" })
		vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = "#B2A790" })
	end,
})

vim.cmd([[colorscheme zenbones]])
vim.o.background = "light"
