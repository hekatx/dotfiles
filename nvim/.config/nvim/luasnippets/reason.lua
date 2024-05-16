local ls = require("luasnip")
local t = ls.text_node
local sn = ls.snippet_node
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node

local snippets = {}

local function cs(trigger, nodes)
	local snippet = s(trigger, nodes)
	table.insert(snippets, snippet)
end

cs(
	{
		trig = "mkr",
		name = "make react component",
	},
	fmt(
		[[[@react.component]
let make = ({}) => {{
  {}
}}]],
		{
			i(1, "props"),
			i(2, "body"),
		}
	)
)

cs(
	{ trig = "melr" },
	fmt([[[%%mel.raw {{|{}|}}];]], {
		c(1, {
			t("let some = 'js here';"),
			sn(2, { t('import "'), i(1, "path"), t('"') }),
		}),
	})
)

cs(
	{ trig = "melm" },
	fmt([[[@mel.module "{}"]{}]], {
		i(1, "module-path"),
		c(2, {
			t(";"),
			sn(2, { t("external "), i(1, "_var-declaration") }),
			sn(3, { t("external "), i(1, "css"), t(': Js.t({{..}}) = "default";') }),
		}),
	})
)

cs(
	{ trig = "cssm" },
	fmt([[[@mel.module "./{}.module.css"] external {}: Js.t({{..}}) = "default";]], {
		i(1, "name"),
		i(2, "var_name"),
	})
)

cs(
	{ trig = "cln" },
	fmt([[className="{}"]], {
		i(1, "class"),
	})
)

return snippets
