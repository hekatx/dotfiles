local ls = require("luasnip")
local t = ls.text_node
local sn = ls.snippet_node
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local extras = require("luasnip.extras")
local r = extras.rep

local snippets = {}

local function cs(trigger, nodes)
  local snippet = s(trigger, nodes)
  table.insert(snippets, snippet)
end

cs(
    { trig = "!clog", name = "JS Console log", snippetType = "autosnippet" },
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
        trig = "!arrow",
        name = "Arrow function",
        snippetType = "autosnippet"
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
                t(""),
                sn(1, { t(": "), i(1, "Interface or type") }),
                sn(2, { t(": React.FC< "), i(1, "Component props"), t(">") }),
            }),
            c(3, {
                t(""),
                i(1, "arg"),
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
        trig = "!fn",
        name = "Regular function",
        snippetType = "autosnippet"
    },
    fmt(
        [[
function {}({}) {{
  {}
  return {}
}}
]],
        {
            i(1, "fn_name"),
            i(2, "args"),
            i(3, "fn_body"),
            c(4, {
              t(""),
              i(1, "value")
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
        trig = "!int",
        name = "Typescript interface declaration",
        snippetType = "autosnippet"
    },
    fmt(
        [[
  interface {} {{
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
    { trig = "!us", name = "Create React state using useState hook", snippetType = "autosnippet" },
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
    { trig = "!ur", name = "Create React ref", snippetType = "autosnippet" },
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
  { trig = "!exc", name = "Export constant", snippetType = "autosnippet" },
  fmt("export const {} = {};", {
    i(1, "name"),
    i(2, "value"),
  })
)

cs(
  { trig = "!rctx", name = "React context template", snippetType = "autosnippet" },
  fmt(
    [[
import {{ createContext, FunctionComponent, useMemo, useContext }} from "react";

export interface {}Props {{
    {}
}}

export const {} = createContext<{}Props | undefined>(undefined);

export const {}Provider: FunctionComponent<{{
    {}
}}> = ({{
    {}, children
}}) => {{
    {}

    const contextValue = useMemo({});

    return <{}.Provider
        value={{contextValue}}
        children={{children}}
    />;
}}

export const use{} = (): {}Props => {{
    const contextValue = useContext({});
    if (!contextValue) {{
        throw new Error("Tried to use {} from outside the provider");
    }}
    return contextValue;
}}
    ]], 
    {
      i(1, "Context name"),
      i(2, "props"),
      r(1),
      r(1),
      r(1),
      i(3, "initial props"),
      i(4, "initial values"),
      i(5, "context body"),
      i(6, "memoized context value"),
      r(1),
      r(1),
      r(1),
      r(1),
      r(1)

    }
  )
)

cs({ trig = "!if", name = "js if", snippetType = "autosnippet" },
  fmt([[
    if({}) {{
      {}
    }}
  ]], {
      i(1, "condition"),
      i(2, "effect")
    })
)

cs({ trig = "!tpq", name = "tRPC private procedure query", snippetType = "autosnippet" },
  fmt([[
  {}: privateProcedure.query(({{ ctx }}) => {{
    {}

    return {};
  }}),
  ]], {
      i(1, "name"),
      i(2, "body"),
      i(2, "result")
    })
)

return snippets
