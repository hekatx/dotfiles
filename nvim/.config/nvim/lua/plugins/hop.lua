return {
	"smoka7/hop.nvim",
	version = "*",
	keys = {
		{
			"<leader>h",
			function()
				require("hop").hint_words()
			end,
			desc = "Hop to a word",
		},
		{
			"<leader>j",
			function()
				require("hop").hint_words({ current_line_only = true })
			end,
			desc = "Hop on the current line",
		},
	},
	opts = { keys = "etovxqpdygfblzhckisuran" },
}
