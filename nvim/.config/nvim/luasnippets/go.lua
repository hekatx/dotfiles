local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node
local c = ls.choice_node

local snippets = {}

local function cs(trigger, nodes)
	local snippet = s(trigger, nodes)
	table.insert(snippets, snippet)
end

cs(
	{ trig = "tfail", name = "fatal assertion for tests" },
	fmt(
		[[ t.{}("{}, got={}", {}) ]],
		{ c(1, {
			t("Fatalf"),
			t("Errorf"),
		}), i(2, "expected"), i(3, "got"), i(4, "args") }
	)
)

cs(
	{ trig = "forr", name = "for range" },
	fmt(
		[[ for {}, {} := range {} {{
  {}
}}
  ]],
		{ c(1, { t("i"), t("_") }), i(2, "item"), i(3, "iterator"), i(4, "statements") }
	)
)

cs(
	{ trig = "if", name = "ifstatement" },
	fmt(
		[[if {} {{ 
  {}
}}]],
		{ i(1, "condition"), i(2, "statement") }
	)
)

cs(
	{ trig = ",:", name = "declare tuple" },
	fmt([[{}, {} := {}]], { i(1, "variable"), c(2, { t("err"), t("ok") }), i(3, "expression") })
)

cs({ trig = 'func', name = "function declaration" }, fmt([[func {}({}){} {{
  {}
}}]], { i(1, "function"), i(2), i(3), i(4, "statements") }) )

return snippets
