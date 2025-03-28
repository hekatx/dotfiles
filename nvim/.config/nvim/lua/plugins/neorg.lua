return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	dependencies = {
		{ dir = "~/Documents/personal/plugin" },
		"benlubas/neorg-query",
	},
	config = function()
		local norg = require("neorg")
		norg.setup({
			load = {
				["core.export"] = {},
				["core.summary"] = {},
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.journal"] = {},
				["core.neorgcmd.commands.return"] = {},
				["core.keybinds"] = {
					config = {
						hook = function(keybinds)
							keybinds.map("norg", "n", "<Space>oo", "<cmd>Neorg return<CR>")
						end,
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							personal = "~/notes/personal",
							work = "~/notes/work",
						},
						default_workspace = "work",
					},
				},
				-- default values
				["external.query"] = {
					-- Populate the database. Indexing happens on a separate thread, so doesn't block
					-- neovim. Funny enough, this is the only user facing way to trigger a full index of your
					-- workspace at the moment
					index_on_launch = true,

					-- Update the db entry when a file is written
					update_on_change = true,
				},
				["external.jira"] = {},
			},
		})
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = { "*.norg" },
			command = "set conceallevel=3",
		})
	end,
}
