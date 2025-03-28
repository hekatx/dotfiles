vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		-- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#333f4a" })
		-- vim.api.nvim_set_hl(0, "DiffChange", { bg = "#333f4a" })
		-- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#2f3e4a" })
		-- vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "#506477" })
		-- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#FFFAC2" })
		-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#FFFAC2" })
		-- vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#FFFAC2" })
		-- vim.api.nvim_set_hl(0, "DiagnosticDefaultHint", { fg = "#FFFAC2" })
		-- vim.api.nvim_set_hl(0, "DiagnosticDefaultHint", { fg = "#FFFAC2" })
		vim.api.nvim_set_hl(0, "NeotestRunning", { fg = "#EDC77A" })
		vim.api.nvim_set_hl(0, "NeotestPassed", { fg = "#7FBCB4" })
		vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = "#B2A790" })
	end,
})
--
-- vim.cmd([[colorscheme poimandres]])

-- vim.cmd("colorscheme kanagawa-dragon")
vim.cmd([[colorscheme zenbones]])
vim.o.background = "light"
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd.colorscheme("oxocarbon")
