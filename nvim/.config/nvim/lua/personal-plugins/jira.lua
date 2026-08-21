local Morph = require("morph")
local h = Morph.h

-- Create a simple counter component
--- @param ctx morph.Ctx<{}, { count: integer }>
local function Counter(ctx)
	if ctx.phase == "mount" then
		ctx.state = { count = 0 }
	end

	return {
		h.Title({}, "Count: "),
		h.Number({}, tostring(ctx.state.count)),
		"\n",
		h.Keyword({
			nmap = {
				["<CR>"] = function()
					ctx:update({ count = ctx.state.count + 1 })
					return "" -- consume the keypress
				end,
			},
		}, "[Press Enter to increment]"),
		h.ErrorMsg({
			extmark = {
				virt_text = { { " ← Error here", "Comment" } },
			},
		}, "Invalid input"),
	}
end

-- Render to current buffer
-- local renderer = Morph.new()
-- renderer:mount(h(Counter, {}, {}))
