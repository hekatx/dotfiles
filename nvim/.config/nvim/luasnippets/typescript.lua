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
	{ trig = "clog", name = "JS Console log" },
	fmt(
		[[
console.log({})
]],
		{
			i(1, ""),
		}
	)
)

cs(
	{
		trig = "fc",
		name = "React Functional commponent",
	},
	fmt(
		[[
  const {}{} = ({}) => {{
    {}
    return {}
  }}
  ]],
		{
			i(1, "fn_name"),
			c(2, {
				sn(1, { t(": "), i(1, "Interface or type") }),
				sn(2, { t(": React.FC< "), i(1, "Component props"), t(">") }),
				t(""),
			}),
			c(3, {
				i(1, "arg"),
				t(""),
			}),
			c(4, {
				i(1, "fn body"),
				t(""),
			}),
			i(5, "return value"),
		}
	)
)

cs(
	{
		trig = "af",
		name = "Arrow function",
	},
	fmt(
		[[
const {} = ({}) => {}
]],
		{
			i(1, "fn_name"),
			i(2, "args"),
			i(3, "return_value"),
		}
	)
)

cs(
	{
		trig = "mh",
		name = "Mouse event handler function",
	},
	fmt(
		[[
const handle{} = ({}) => {{
  {}
}}
]],
		{
			i(1, "fn_name"),
			c(2, {
				sn(1, { t("e: MouseEvent<"), i(1, "Element"), t(">") }),
			}),
			i(3, "fn_body"),
		}
	)
)

cs(
	{
		trig = "int",
		name = "Typescript interface declaration",
	},
	fmt(
		[[
  interface I{} {{
    {}: {};
  }}
  ]],
		{
			i(1, "interface_name"),
			i(2, "prop_name"),
			i(3, "prop_type"),
		}
	)
)

cs(
	{ trig = "aq", name = "Create GraphQL query file" },
	fmt(
		[[
  import {{ gql }} from '@apollo/client';

  export const {} = gql`
  {}
  `;]],
		{
			f(function(_args, snip)
				local name = vim.split(snip.snippet.env.TM_FILENAME, ".", true)
				local operationType = string.upper(string.sub(name[2], 1, 1)) .. string.sub(name[2], 2, -1)
				return name[1] .. operationType
			end),
			i(2, "query"),
		}
	)
)
cs(
	{ trig = "us", name = "Create React state using useState hook" },
	fmt("const [{}, {}] = useState({});", {
		i(1, "state"),
		f(function(args)
			local name = args[1][1]
			local first = string.upper(string.sub(name, 1, 1))
			local rest = string.sub(name, 2, -1)
			return "set" .. first .. rest
		end, { 1 }),
		i(0),
	})
)

cs(
	{ trig = "ur", name = "Create React ref" },
	fmt("const {} = useRef{}({})", {
		i(1, "ref_name"),
		c(2, {
			sn(1, { t("<"), i(1, "Type"), t(">") }),
			t(""),
		}),
		i(3, "null"),
	})
)

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

return snippets
