local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {}

local function cs(trigger, nodes)
	local snippet = s(trigger, nodes)
	table.insert(snippets, snippet)
end

cs(
	{ trig = "[", name = "[ brackets ]" },
	fmt(
		[[
    [{}]
  ]],
		{ i(1, "") }
	)
)

cs(
	{ trig = "{", name = "{ brackets }" },
	fmt(
		[[
    {{
      {}
    }},
  ]],
		{ i(1, "") }
	)
)

cs({ trig = '"', name = "quote" }, fmt([["{}"]], { i(1, "") }))

cs(
	{ trig = "fn", name = "function" },
	fmt(
		[[
function({})
  {}
end
]],
		{
			i(1, "args"),
			i(2, "body"),
		}
	)
)

cs(
	{ trig = "snip", name = "snippet" },
	fmt(
		[[
cs({{ trig = '{}', name = "{}" }}, fmt({}) )]],
		{
			i(1, "trigger"),
			i(2, "name"),
			i(3, "content"),
		}
	)
)

return snippets
