return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	config = function()
		local ls = require("luasnip")

		ls.filetype_extend("typescriptreact", { "typescript" })
		ls.filetype_extend("javascriptreact", { "typescript" })
		ls.filetype_extend("javascript", { "typescript" })
		ls.filetype_extend("astro", { "typescript" })
		require("luasnip.loaders.from_lua").load({
			paths = vim.fn.stdpath("config") .. "/luasnippets",
		})

		ls.config.set_config({
			history = true,
			store_selection_keys = "<Tab>",
			enable_autosnippets = true,
		})

		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		vim.keymap.set("i", "<C-u>", require("luasnip.extras.select_choice"))
		vim.api.nvim_create_user_command("LuaSnipEdit", function()
			require("luasnip.loaders").edit_snippet_files()
		end, { bang = true })
	end,
}
