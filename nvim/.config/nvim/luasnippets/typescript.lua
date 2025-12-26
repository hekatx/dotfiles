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
      c(3, {
        i(1, "return value"),
        sn(2, { t("{"), i(1, "fn"), t("}") }),
      }),
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
        local name = vim.split(snip.snippet.env.TM_FILENAME, ".", nil)
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
  { trig = "br", name = "[ brackets ]" },
  fmt(
    [[
    [{}]
  ]],
    { i(1, "") }
  )
)

cs(
  { trig = "bl", name = "{ brackets }" },
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

cs(
  { trig = "stwm", name = "string class attribute to twMerge" },
  f(function(args, snip)
    local res, env = {}, snip.env
    table.insert(res, "{twMerge(")
    for _, ele in ipairs(env.LS_SELECT_RAW) do
      table.insert(res, ele)
    end
    table.insert(res, ")}")
    return res
  end)
)

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
  {
    trig = "fn",
    name = "Function",
  },
  fmt(
    [[
function {}({}) {{
  {}
}}
]],
    {
      i(1, "fn_name"),
      c(2, {
        i(1, "args"),
        t("{ children }: { children: ReactNode }"),
        t("")
      }),
      c(3, {
        i(1, "body"),
        sn(2, { t("return("), i(1, "v"), t(")") })
      }),
    }
  )
)

cs(
  {
    trig = "cln",
    name = "className",
  },
  fmt([[className={}]], {
    c(1, {
      sn(1, { t("\""), i(1, "class"), t("\"") }),
      sn(2, { t("{"), i(1, "class"), t("}") }),
      sn(3, { t("{`"), i(1, "class"), t("`}") }),
    }),
  })
)

cs(
  { trig = "$", snippetType = "autosnippet" },
  fmt([[${}]], {
    c(1, {
      sn(1, { t("{"), i(1, ""), t("}") }),
      i(2, "")
    })
  })
)

cs({ trig = 'inte', name = "Interface ts" },
  fmt([[interface {} = {{
  {}
}}]],
    { i(1, "Type"), i(2, "Props") }
  )
)

cs({ trig = 'ch', name = "react children" }, fmt([[children: ReactNode]], {}))

cs({ trig = 'tpr', name = "prop" }, fmt([[{}: {},]], {
  i(1, "prop"),
  -- todo: recursive type expand upon | char
  c(2, {
    t("string"),
    t("number"),
    t("boolean"),
    i(4, "typedef")
  }),
}))

cs({ trig = 'pr', name = "prop" }, fmt([[{}: {},]], {
  i(1, "prop"),
  -- todo: recursive type expand upon | char
  c(2, {
    sn(1, { t([["]]), i(1, "string"), t([["]]) }),
    i(2, "anyothertype")
  }),
}))

cs({ trig = 'utra', name = "useTranslation" }, fmt([[const {{ t }} = useTranslation();]], {}))
cs({ trig = 'uref', name = "useRef" }, fmt([[const {} = useRef{}({});]], {
  i(1, "ref"),
  c(2, { sn(1, { t("<"), i(1, "Type"), t(">") }), t("") }),
  c(3, { t("null"), i(2, "defaultValue") })
}))

cs({ trig = 'rnf', name = "react native flex row" },
  fmt([[ display: "flex", flexDirection: {}, ]], {
    c(1, {
      t([["row"]]),
      t([["column"]])
    }),
  }))

cs({ trig = 'ali', name = "alignItems" },
  fmt([["alignItems": {}]], { c(1, { t([["center"]]), t([["start"]]), t([["end"]]) }) }))
cs({ trig = 'jtc', name = "justifyContent" },
  fmt([["justifyContent": {}]], { c(1, { t([["space-between"]]), t([["center"]]), t([["start"]]), t([["end"]]) }) }))

cs({ trig = 'ntt', name = "nested text text" }, fmt([[<Text {}>
  {}
  <Text {}>
    {}
  </Text>
</Text>]], {
  i(1, "outer props"),
  i(2, "outer text"),
  i(3, "inner props"),
  i(4, "inner text"),
}))

cs({ trig = 't', name = "translationkey" }, fmt([[t('{}')]], { i(1, 'key') }))
cs({ trig = 'fw', name = "fullWidt" }, fmt("fullWidth", {}))
cs({ trig = 'pad', name = "" }, fmt("fullWidth", {}))

cs({ trig = 'dscln', name = "design system cln" }, fmt([[classNames={{{{ root: {{ {} }}}}}}]], { i(1, "class") }))

cs({ trig = 'jmrac', name = "juntos mobile react arrow component" }, fmt([[
import React from 'react';

const {name}: React.FC = () => {{
  return (
    {}
  );
}};

export default {name};
]], {
    name = f(function(_args, snip)
      return vim.split(snip.snippet.env.TM_FILENAME, ".", nil)[1]
    end),
    i(2, "content")
  },
  {
    repeat_duplicates = true,
  }
))

cs({ trig = 'stc', name = "stylesheet" }, fmt([[const styles = StyleSheet.create({{
  {}
}});]], { i(1, "styles") }))

cs({ trig = 'desc', name = "name" }, fmt([[describe("{}", () => {{
  {}
}})]], { i(1, "situation"), i(2, "code here...") }))

cs({ trig = 'it', name = "name" }, fmt([[it("{}", () => {{
  {}
}})]], { i(1, "situation"), i(2, "code here...") }))


return snippets
