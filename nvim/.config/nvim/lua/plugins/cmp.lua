local M = {
	"saghen/blink.cmp",
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		snippets = {
			preset = "luasnip",
		},
		keymap = {
			["<C-l>"] = { "select_and_accept" },
		},
		completion = {
			trigger = {
				show_on_keyword = false,
			},
		},
	},
}

return M
