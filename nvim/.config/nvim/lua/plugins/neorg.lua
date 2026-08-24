return {
	"nvim-neorg/neorg",
	ft = "norg",
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},
			},
		})

		vim.opt_local.foldlevel = 99
		vim.opt_local.conceallevel = 2
	end,
}
