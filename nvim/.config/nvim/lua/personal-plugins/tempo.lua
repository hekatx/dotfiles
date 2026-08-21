local apikey = "7gryl6WeYr4wWAxOzOTiUtNb6b30bP-us"

vim.net.request("https://api.github.com/repos/neovim/neovim", {}, function(err, res)
	if err then
		return
	end
	local stars = vim.json.decode(res.body).stargazers_count
	vim.print(("Neovim currently has %d stars"):format(stars))
end)
