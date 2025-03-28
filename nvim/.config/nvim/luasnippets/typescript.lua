local ls = require("luasnip")
local t = ls.text_node
local sn = ls.snippet_node
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local c = ls.choice_node
local f = ls.function_node

local snippets = {}

local function cs(trigger, nodes)
	local snippet = s(trigger, nodes)
	table.insert(snippets, snippet)
end

cs(
	{ trig = "ei", name = "eslint ignore comment" },
	fmt(
		[[
// eslint-disable-next-line
]],
		{}
	)
)

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
	fmt([[({}) => {}]], {
		i(1, "args"),
		c(2, {
			i(1, "return value"),
			sn(2, { t("{"), i(1, "fn"), t("}") }),
		}),
	})
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
			i(1, "name"),
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

cs(
	{ trig = "context", name = "React context template with custom hook" },
	fmt(
		[[
export interface {name}ContextProps {{
    {name}Value: any;
}}

export const {name}Context = React.createContext<{name}ContextProps | undefined>(undefined);

export const {name}ContextProvider: React.FunctionComponent<{{
    initial{name}Value: any
}}> = ({{
    initial{name}Value, children
}}) => {{
    const [{name}Value, set{name}Value,] = React.useState(initial{name}Value);

    const contextValue = React.useMemo(() => ({{
        {name}Value,
    }}), [
        {name}Value,
    ]);
    return <{name}Context.Provider
        value={{contextValue}}
        children={{children}}
    />;
}}

export const use{name}Context = (): {name}ContextProps => {{
    const contextValue = React.useContext({name}Context);
    if (!contextValue) {{
        throw new Error("Tried to use {name} context from outside the provider");
    }}
    return contextValue;
}};
  ]],
		{
			name = i(1, "name"),
		},
		{
			repeat_duplicates = true,
		}
	)
)

cs(
	{
		trig = "ueff",
		name = "useEffect react hook",
	},
	fmt(
		[[
useEffect(() => {{
{}
}}, [{}])
]],
		{
			i(1, "fn"),
			i(2, "dependencies"),
		}
	)
)

cs(
	{ trig = "hlen", name = "declare variable for checking length" },
	fmt(
		[[
const has{} = ({}?.length ?? 0) > 0;
  ]],
		{
			i(1, "Items"),
			i(2, "items"),
		}
	)
)

cs(
	{ trig = "eret", name = "early return" },
	fmt(
		[[
if ({}) return{}
]],
		{
			i(1, "condition"),
			c(2, {
				t(";"),
				sn(1, { t(" "), i(1, "value") }),
			}),
		}
	)
)

cs({ trig = "cln", name = "className attribute" }, fmt([[className="{}"]], { i(1, "class") }))

cs({ trig = "stwm", name = "string class attribute to twMerge" }, {
	f(function(_, snip)
		local res, env = {}, snip.env
		table.insert(res, "{twMerge(")
		local selection = env.LS_SELECT_RAW
		for index, ele in ipairs(selection) do
			if index == #selection then
				table.insert(res, ele .. ",")
			else
				table.insert(res, ele)
			end
		end
		return res
	end),
	i(1, "className"),
	t(")}"),
})

cs(
	{ trig = "mtd", name = "method" },
	fmt(
		[[
{}: ({}) => {{
{}
}}
]],
		{
			i(1, "methodName"),
			c(2, {
				t(""),
				i(2, "args"),
				sn(3, { t("{"), i(1, "destructured"), t("}") }),
			}),
			i(3, "method body"),
		}
	)
)

cs(
	{ trig = "fn" },
	fmt(
		[[
    function {}({}) {{
      {}
    }}
  ]],
		{
			i(1, "fn_name"),
			i(2, "args"),
			i(3, "body"),
		}
	)
)

cs(
	{ trig = "impas" },
	fmt(
		[[
    import {{ {} as {} }} from '{}'
    ]],
		{
			i(1, "ReactComponent"),
			i(2, "NewName"),
			c(3, {
				i(1, "dir"),
				sn(2, { t("@/"), i(1, "dir") }),
			}),
		}
	)
)

cs(
	{ trig = "rudd" },
	fmt(
		[[
    window.rudderanalytics.track({}, {{
      {}
    }});
    ]],
		{
			i(1, "event name"),
			i(2, "props"),
		}
	)
)

cs(
	{ trig = "dti" },
	fmt([[data-testId="{}"]], {
		i(1, "id"),
	})
)

cs(
	{ trig = "jit" },
	fmt(
		[[it("{}", async () => {{
  {}
}})]],
		{
			i(1, "has to do something good"),
			i(2, "when you do stuff like this"),
		}
	)
)

cs(
	{ trig = "jdes" },
	fmt(
		[[describe("{}", () => {{
  {}
}})]],
		{
			i(1, "some main behaviour"),
			i(2, "when this happens"),
		}
	)
)

cs(
	{ trig = "utra" },
	fmt([[const {{ t }} = useTranslation({})]], {
		c(1, {
			t(""),
			i(2, "args"),
		}),
	})
)

cs(
	{ trig = "tfu" },
	fmt([[t('{}'{})]], {
		i(1, "key"),
		c(2, {
			t(""),
			sn(2, { t("{"), i(1, "options"), t("}") }),
		}),
	})
)

cs(
	{ trig = "switcher" },
	fmt(
		[[
  export function {}Switcher() {{
    const countryCode = getCurrentCountry() as Countries;
    switch(countryCode) {{
      case 'BR':
      case 'MX':
      case 'CO':
      case 'GT':
      case 'PA':
      default: {{
        const exhaustiveCheck: never = countryCode;
          return null
      }}
    }}
  }}
  ]],
		{
			i(1, "ComponentName"),
		}
	)
)

cs(
	{ trig = "ccg" },
	fmt(
		[[
const config = {{
  BR: {{
    {}
  }},
  MX: {{
    {}
  }},
  CO: {{
    {}
  }},
  GT: {{
    {}
  }},
  PA: {{
    {}
  }},
}};
]],
		{
			i(1, "config: null"),
			rep(1),
			rep(1),
			rep(1),
			rep(1),
		}
	)
)

cs({ trig = "ct", name = "const variable" }, fmt([[const {} = {}]], { i(1), i(2) }))

cs({ trig = "exp", name = "expect" }, fmt([[expect({}).{}({})]], { i(1, "got"), i(2, "qualifier"), i(3, "expected") }))

cs(
	{ trig = "forof", name = "for .. of .. loop" },
	fmt(
		[[for (const {} of {}) {{
{}
}}
]],
		{ i(1, "variable"), i(2, "iterator"), i(3, "statements") }
	)
)

cs({ trig = "i1", name = "internationalization" }, fmt([[i18n.t("{}")]], { i(1) }))

cs(
	{ trig = "juntostest", name = "juntos+ project test file" },
	fmt(
		[[
import {{ MsalReactTester }} from "msal-react-tester";
import {{ describe, it, beforeEach, afterEach, expect }} from "vitest";
import {{ server }} from "@/mocks/msw";
import {{ setupComponent }} from "@/helpers/testing";
import {{ cleanup }} from "@testing-library/react";
import {{ {} }} from "./{}";
import {{ HttpResponse, http }} from "msw";
import i18n from "@/core/translations/i18next.config";

let msalTester = new MsalReactTester("Redirect");

beforeEach(async () => {{
  msalTester = new MsalReactTester("Redirect");
  msalTester.spyMsal();
  await msalTester.isLogged();
}});

afterEach(() => {{
  msalTester.resetSpyMsal();
  server.resetHandlers();
  cleanup();
}});

const setup{} = async (options?: any) => {{
  await msalTester.isLogged();

  const component = await setupComponent(<{} />, {{
    msal: msalTester,
    ...(options ? options : {{}}),
  }});
  await msalTester.waitForRedirect();
  return component;
}};

describe("<{} />", async () => {{
  {}
}});
]],
		{ i(1, "Component"), rep(1), rep(1), rep(1), rep(1), i(2) }
	)
)

cs(
	{ trig = "waitfor", name = "waitfor function" },
	fmt(
		[[await waitFor(() => {{
  {}
}})]],
		{ i(1) }
	)
)

cs({ trig = "tuc", name = "test user click" }, fmt([[await user.click({})]], { i(1) }))
cs({ trig = "tuk", name = "test user keyboard" }, fmt([[await user.keyboard({})]], { i(1) }))
cs(
	{ trig = "texr", name = "typescript expect error directive" },
	fmt([[// @ts-expect-error{}]], { c(1, { t(""), sn(1, { i(1, "Reason") }) }) })
)
cs(
	{ trig = "if", name = "just ur regular if" },
	fmt([[if ({}) {}]], {
		i(1, "condition"),
		c(2, {
			sn(1, { i(1, "consequence") }),
			sn(
				2,
				fmt(
					[[{{
  {}
}}]],
					{ i(1) }
				)
			),
		}),
	})
)

return snippets
