return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	config = function()
		local norg = require("neorg")
		norg.setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							personal = "~/notes/personal",
						},
						default_workspace = "personal",
					},
				},
			},
		})
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = { "*.norg" },
			command = "set conceallevel=3",
		})
	end,
}
