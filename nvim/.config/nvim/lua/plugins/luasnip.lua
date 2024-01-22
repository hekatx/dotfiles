local M = {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
}

M.config = function()
	local ls = require("luasnip")

	ls.filetype_extend("typescriptreact", { "typescript" })
	ls.filetype_extend("astro", { "typescript" })
	require("luasnip.loaders.from_lua").load({
		paths = "~/.config/nvim/luasnippets/",
	})

	ls.config.set_config({
		history = true,
		store_selection_keys = "<Tab>",
	})

	ls.add_snippets("all", {
		ls.s("fuc", ls.t("SHIT FUCK")),
	})

	-- <c-k> is my expansion key
	-- this will expand the current item or jump to the next item within the snippet.
	vim.keymap.set({ "i", "s" }, "<c-k>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, { silent = true })

	-- <c-j> is my jump backwards key.
	-- this always moves to the previous item within the snippet
	vim.keymap.set({ "i", "s" }, "<c-j>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { silent = true })

	-- <c-l> is selecting within a list of options.
	-- This is useful for choice nodes (introduced in the forthcoming episode 2)
	vim.keymap.set("i", "<c-l>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end)

	vim.keymap.set("i", "<c-u>", require("luasnip.extras.select_choice"))
	vim.api.nvim_create_user_command(
		"LuaSnipEdit",
		'lua require("luasnip.loaders").edit_snippet_files()',
		{ bang = true }
	)
end

return M
