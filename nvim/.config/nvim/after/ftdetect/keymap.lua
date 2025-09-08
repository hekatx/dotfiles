vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.keymap",
	desc = "Detect and set the proper file type for ZMK Keymap files",
	callback = function()
		vim.cmd("set filetype=dts")
	end,
})
