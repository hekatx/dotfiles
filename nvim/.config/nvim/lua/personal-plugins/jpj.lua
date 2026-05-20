local rest = require("rest-nvim.client.curl.cli")
local nio = require("nio")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- internal methods
local main = {}
local btoa = vim.base64.encode(vim.env.JIRA_USER .. ":" .. vim.env.JIRA_API_TOKEN)

-- vim.print(btoa)

-- vim.print(btoa);

local request_body = {
	jql = 'project = AGL99036 AND assignee = currentUser() AND Sprint = "PI5_2025 Postorder Sprint 6" AND status != Done ORDER BY created DESC',
	maxResults = 16,
	fields = { "summary", "issuetype" },
}

local cached_response = nil

function main.create_branch_from_ticket()
	nio.run(function()
		local _, res = pcall(rest.request({
			method = "POST",
			url = vim.env.JIRA_INSTANCE .. "/rest/api/3/search/jql",
			cookies = {},
			headers = {
				["Authorization"] = { "Basic " .. btoa },
				["content-type"] = { "application/json" },
				["accepts"] = { "application/json" },
			},
			body = {
				__TYPE = "json",
				data = vim.json.encode(request_body),
			},
		}).wait)

		local issues = vim.json.decode(res.body).issues

		local opts = opts or {}
		pickers
			.new(opts, {
				prompt_title = "colors",
				finder = finders.new_table({
					results = issues,
					entry_maker = function(entry)
						return {
							value = entry,
							display = entry.key .. " " .. entry.fields.summary,
							ordinal = entry.key,
						}
					end,
				}),
				sorter = conf.generic_sorter(opts),
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						local types = {
							["Sub-Tarea"] = "feat",
							["Defecto"] = "fix",
						}
						vim.system({
							"git",
							"switch",
							"-c",
							types[selection.value.fields.issuetype.name] .. "/" .. selection.value.key,
						})
					end)
					return true
				end,
			})
			:find()
	end)
end

vim.api.nvim_create_user_command("Jpj", function()
	main.create_branch_from_ticket()
end, {})
