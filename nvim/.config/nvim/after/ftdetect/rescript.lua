vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.res,*.resi",
	desc = "Detect and set the proper file type for Rescript files",
	callback = function()
		vim.cmd("set filetype=rescript")
	end,
})
