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

cs({ trig = "[{", name = "Link" }, fmt([[[`{}`]{{{}}}]], { i(1, "name"), i(2, "url") }))

return snippets
