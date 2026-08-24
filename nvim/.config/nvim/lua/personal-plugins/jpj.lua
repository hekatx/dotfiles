local M = {}

function M.create_branch_from_ticket()
	local rest = require("rest-nvim.client.curl.cli")
	local nio = require("nio")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local user = vim.env.JIRA_USER
	local token = vim.env.JIRA_API_TOKEN
	local instance = vim.env.JIRA_INSTANCE
	if not user or not token or not instance then
		vim.notify("JIRA_USER, JIRA_API_TOKEN, and JIRA_INSTANCE are required", vim.log.levels.WARN)
		return
	end

	local request_body = {
		jql = 'project = AGL99036 AND assignee = currentUser() AND Sprint = "PI5_2025 Postorder Sprint 6" AND status != Done ORDER BY created DESC',
		maxResults = 16,
		fields = { "summary", "issuetype" },
	}
	local authorization = vim.base64.encode(user .. ":" .. token)

	nio.run(function()
		local ok, response = pcall(function()
			return rest.request({
				method = "POST",
				url = instance .. "/rest/api/3/search/jql",
				cookies = {},
				headers = {
					["Authorization"] = { "Basic " .. authorization },
					["content-type"] = { "application/json" },
					["accept"] = { "application/json" },
				},
				body = {
					__TYPE = "json",
					data = vim.json.encode(request_body),
				},
			}).wait()
		end)

		if not ok or not response or response.body == nil then
			vim.notify("Unable to fetch Jira tickets", vim.log.levels.WARN)
			return
		end

		local decoded = vim.json.decode(response.body)
		local issues = decoded.issues or {}
		local opts = {}

		pickers
			.new(opts, {
				prompt_title = "Jira tickets",
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
						if not selection then
							return
						end

						local prefixes = {
							["Sub-Tarea"] = "feat",
							["Defecto"] = "fix",
						}
						local prefix = prefixes[selection.value.fields.issuetype.name] or "chore"
						vim.system({ "git", "switch", "-c", prefix .. "/" .. selection.value.key })
					end)
					return true
				end,
			})
			:find()
	end)
end

vim.api.nvim_create_user_command("Jpj", function()
	M.create_branch_from_ticket()
end, { desc = "Create a branch from a Jira ticket" })
