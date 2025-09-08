local ls = require("luasnip")
local t = ls.text_node
local sn = ls.snippet_node
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node

local snippets = {}

local function cs(trigger, nodes)
	local snippet = s(trigger, nodes)
	table.insert(snippets, snippet)
end

cs(
	{
		trig = "leq",
		name = "long, multiline equation",
	},
	fmt(
		[[$
  & {} \
  {}
$
    ]],
		{
			i(1, "math here"),
			i(2, ""),
		}
	)
)

cs(
	{
		trig = "fa",
		name = "forall",
	},
	fmt([[forall {}]], {
		i(1, "x"),
	})
)

cs(
	{
		trig = "ex",
		name = "exists",
	},
	fmt([[exists {}]], {
		i(1, "x"),
	})
)

return snippets
