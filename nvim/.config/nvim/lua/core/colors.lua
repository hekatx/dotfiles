-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#333f4a" })
-- 		vim.api.nvim_set_hl(0, "DiffChange", { bg = "#333f4a" })
-- 		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#2f3e4a" })
-- 		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "#506477" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#FFFAC2" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#FFFAC2" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#FFFAC2" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticDefaultHint", { fg = "#FFFAC2" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticDefaultHint", { fg = "#FFFAC2" })
-- 	end,
-- })
--
-- vim.cmd([[colorscheme poimandres]])

vim.cmd("colorscheme kanagawa")

require("transparent").setup({ -- Optional, you don't have to run setup.
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	},
	extra_groups = {}, -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear
})
