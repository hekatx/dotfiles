local u = require("core/utils")

-- Telescope maps
u.map("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { desc = "[Telescope] - Find files under cwd" })
u.map("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { desc = "[Telescope] - Grep in cwd" })
u.map("n", "<leader>tu", "<cmd>Telescope buffers<cr>", { desc = "[Telescope] - List all open buffers" })
u.map("n", "<leader>tb", "<cmd>Telescope file_browser<cr>", { noremap = true, desc = "[Telescope] - File browser" })
u.map("n", "<leader>tm", "<cmd>Telescope keymaps<cr>", { desc = "[Telescope] - List all keymaps" })
u.map("n", "<leader>ta", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")

-- DAP
u.map("n", "<f12>", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "[DAP] - Toggle breakpoint" })
u.map("n", "<f7>", "<cmd>lua require('dap').step_over()<cr>", { desc = "[DAP] - Step over" })
u.map("n", "<f8>", "<cmd>lua require('dap').step_into()<cr>", { desc = "[DAP] - Step into" })
u.map("n", "<f9>", "<cmd>lua require('dap').step_out()<cr>", { desc = "[DAP] - Step out" })
u.map("n", "<f5>", "<cmd>lua require('dap').continue()<cr>", { desc = "[DAP] - Continue program execution" })
u.map("n", "<f6>", "<cmd>lua require('dap').terminate()<cr>", { desc = "[DAP] - Terminate debugging session" })
u.map("n", "<leader>dt", "<cmd>lua require('dap-go').debug_test()<cr>", { desc = "[DAP] - {go} - Debug Golang test" })

-- Hop
u.map("n", "<leader>h", "<cmd>lua require('hop').hint_words()<cr>", { desc = "[Hop] - Hints all words in the buffer" })
u.map(
	"n",
	"<leader>j",
	"<cmd>lua require('hop').hint_words({ current_line_only = true})<cr>",
	{ desc = "[Hop] - Hints all words in the current line" }
)

-- Neorg
u.map("n", "<leader>oo", "<cmd>Neorg workspace work<CR>", { desc = "[Neorg] - Go to neorg workspace" })
u.map("n", "<leader>oj", "<cmd>Neorg journal<CR>", { desc = "[Neorg] - Go to neorg workspace" })

-- Fugitive
u.map("n", "<leader>ii", "<cmd>vert G<CR>", { desc = "[Fugitive] - Open git status" })
u.map("n", "<leader>ip", ":G push origin ", { desc = "[Fugitive] - Git push" })
u.map("n", "<leader>in", ":G checkout -b ", { desc = "[Fugitive] - Git create branch" })
u.map("n", "<leader>ic", ":G checkout ", { desc = "[Fugitive] - Git checkout branch" })
u.map("n", "<leader>id", ":vert Gdiffsplit! ", { desc = "[Fugitive] - Git diff against { object }" })
u.map("n", "<leader>il", "<cmd>G log<CR>", { desc = "[Fugitive] - Git log" })

-- Neotest
u.map(
	"n",
	"<leader>nf",
	"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
	{ desc = "[Neotest] - Run current file" }
)
u.map("n", "<leader>nr", "<cmd>lua require('neotest').run.run()<CR>", { desc = "[Neotest] - Run nearest test" })
u.map("n", "<leader>ns", "<cmd>lua require('neotest').run.stop()<CR>", { desc = "[Neotest] - Stop testing" })
u.map("n", "<leader>no", "<cmd>lua require('neotest').output.open()<CR>", { desc = "[Neotest] - Open output" })
u.map("n", "<leader>nm", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "[Neotest] - Toggle summary" })

-- Neogit
u.map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "[Neogit] - Open main window" })

-- Miscellaneous
u.map("v", "<leader>p", '"_dP', { desc = "[Misc] - Paste in place without losing the yanked stuff" })
u.map("n", "<leader>il", "<cmd>Oil<CR>", { desc = "Run Oil" })
