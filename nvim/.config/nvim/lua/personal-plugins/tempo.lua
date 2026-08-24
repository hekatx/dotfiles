vim.api.nvim_create_user_command("Tempo", function()
	vim.net.request("https://api.github.com/repos/neovim/neovim", {}, function(err, res)
		if err then
			vim.notify("Unable to fetch Neovim's GitHub stars", vim.log.levels.ERROR)
			return
		end

		local stars = vim.json.decode(res.body).stargazers_count
		vim.notify(("Neovim currently has %d stars"):format(stars), vim.log.levels.INFO)
	end)
end, { desc = "Show Neovim's GitHub star count" })
