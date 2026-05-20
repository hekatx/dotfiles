vim.api.nvim_create_user_command("QFSave", function(opts)
	local qf = vim.fn.getqflist()
	for _, item in ipairs(qf) do
		item.filename = vim.fn.bufname(item.bufnr)
		item.bufnr = nil
	end
	vim.fn.writefile({ vim.fn.json_encode(qf) }, opts.args)
end, { nargs = 1, complete = "file" })

vim.api.nvim_create_user_command("QFLoad", function(opts)
	local data = vim.fn.json_decode(vim.fn.readfile(opts.args)[1])
	vim.fn.setqflist(data)
end, { nargs = 1, complete = "file" })
