return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	config = function()
		local norg = require("neorg")
		norg.setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.ui.calendar"] = {},
				["core.summary"] = {},
				["core.neorgcmd.commands.return"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							personal = "~/notes/personal",
						},
						default_workspace = "personal",
					},
				},
				["core.keybinds"] = {
					config = {
						hook = function(keybinds)
							keybinds.map("norg", "n", "<Leader>oj", "<cmd>Neorg journal<CR>")
						end,
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
