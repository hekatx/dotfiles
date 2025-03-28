local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {}

local function cs(trigger, nodes)
	local snippet = s(trigger, nodes)
	table.insert(snippets, snippet)
end

cs(
	{ trig = "tsconfig", name = "Good default tsconfig" },
	fmt(
		[[
{{
  "compilerOptions": {{
    "rootDirs": ["src"],
    "outDir": "dist",
    "lib": ["es2020"],
    "target": "es2020",
    "module": "esnext",
    "moduleResolution": "node",
    "esModuleInterop": true,
    "types": ["node"]
  }}
}}
]], {}
	)
)

return snippets
