return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"mxsdev/nvim-dap-vscode-js",
	},

	config = function()
		local dap = require("dap")
		local dap_ui = require("dapui")
		-- Go
		require("dap-go").setup()
		-- CPP
		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode",
			name = "lldb",
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},

				runInTerminal = false,
			},
		}
		-- Typescript / Javascript

		local dap_utils = require("dap.utils")
		local dap_vscode_js = require("dap-vscode-js")

		local exts = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		}

		dap_vscode_js.setup({
			node_path = "node",
			debugger_path = os.getenv("HOME") .. "/.DAP/vscode-js-debug",
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})

		for _, ext in ipairs(exts) do
			dap.configurations[ext] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch Current File (pwa-node)",
					cwd = vim.fn.getcwd(),
					args = { "${file}" },
					sourceMaps = true,
					protocol = "inspector",
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch Current File (pwa-node with ts-node)",
					cwd = vim.fn.getcwd(),
					runtimeArgs = { "--loader", "ts-node/esm" },
					runtimeExecutable = "node",
					args = { "${file}" },
					sourceMaps = true,
					protocol = "inspector",
					skipFiles = { "<node_internals>/**", "node_modules/**" },
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch Test Current File (pwa-node with jest)",
					cwd = vim.fn.getcwd(),
					runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
					runtimeExecutable = "node",
					args = { "${file}", "--coverage", "false" },
					rootPath = "${workspaceFolder}",
					sourceMaps = true,
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
					skipFiles = { "<node_internals>/**", "node_modules/**" },
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch Test Current File (pwa-node with vitest)",
					cwd = vim.fn.getcwd(),
					program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
					args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
					autoAttachChildProcesses = true,
					smartStep = true,
					console = "integratedTerminal",
					skipFiles = { "<node_internals>/**", "node_modules/**" },
				},
				{
					type = "pwa-chrome",
					request = "attach",
					name = "Attach Program (pwa-chrome, select port)",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					port = function()
						return vim.fn.input("Select port: ", 9222)
					end,
					webRoot = "${workspaceFolder}",
					skipFiles = { "<node_internals>/**", "node_modules/**", "**/node_modules/**/*", "**/@vite/*" },
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach Program (pwa-node, select pid)",
					cwd = vim.fn.getcwd(),
					processId = dap_utils.pick_process,
					skipFiles = { "<node_internals>/**", "node_modules/**" },
				},
			}
		end
		-- UI

		dap_ui.setup({
			icons = { expanded = "▾", collapsed = "▸" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			expand_lines = false,
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "single", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.25,
						},
						{
							id = "breakpoints",
							size = 0.25,
						},
						{
							id = "stacks",
							size = 0.25,
						},
						{
							id = "watches",
							size = 0.25,
						},
					},
					position = "left",
					size = 70,
				},
				{
					elements = { {
						id = "repl",
						size = 1.0,
					} },
					position = "bottom",
					size = 20,
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dap_ui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dap_ui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dap_ui.close()
		end
	end,
}
