local u = require('core/utils')

vim.g.mapleader = " "

-- Telescope maps
u.map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "[Telescope] - Find files under cwd" })
u.map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", { desc = "[Telescope] - Grep in cwd" })
u.map("n", "<leader>u", "<cmd>Telescope buffers<cr>", { desc = "[Telescope] - List all open buffers" })
u.map("n", "<leader>b", "<cmd>Telescope file_browser<cr>", { noremap = true, desc = "[Telescope] - File browser" })
u.map("n", "<leader>m", "<cmd>Telescope keymaps<cr>", { desc = "[Telescope] - List all keymaps" })

-- Neotest
u.map("n", "<leader>t", "<cmd>lua require('neotest').run.run()<cr>", { desc = "[Neotest] - Run test" })

-- DAP
u.map("n", "<f12>", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "[DAP] - Toggle breakpoint" })
u.map("n", "<f7>", "<cmd>lua require('dap').step_over()<cr>", { desc = "[DAP] - Step over" })
u.map("n", "<f8>", "<cmd>lua require('dap').step_into()<cr>", { desc = "[DAP] - Step into" })
u.map("n", "<f9>", "<cmd>lua require('dap').step_out()<cr>", { desc = "[DAP] - Step out" })
u.map("n", "<f5>", "<cmd>lua require('dap').continue()<cr>", { desc = "[DAP] - Continue program execution" })
u.map("n", "<f6>", "<cmd>lua require('dap').terminate()<cr>", { desc = "[DAP] - Terminate debugging session" })

u.map("n", "<leader>dt", "<cmd>lua require('dap-go').debug_test()<cr>", { desc = "[DAP] - {go} - Debug Golang test" })
u.map("n", "<leader>dp", "<cmd>lua require('dap.ui.widgets').hover()<cr>", { desc = "[DAP] - Hover var under cursor" })

-- Hop
u.map('n', '<leader>h', "<cmd>lua require('hop').hint_words()<cr>", { desc = "[Hop] - Hints all words in the buffer" })
u.map('v', '<leader>h', "<cmd>lua require('hop').hint_lines()<cr>", { desc = "[Hop] - Hints all words in the buffer" })
u.map('n', '<leader>j', "<cmd>lua require('hop').hint_words({ current_line_only = true})<cr>",
    { desc = "[Hop] - Hints all words in the current line" })

-- Miscellaneous
u.map("v", "<leader>p", "\"_dP", { desc = "[Misc] - Paste in place without losing the yanked stuff" })
u.map("n", "<leader>cb", "<cmd>! cmake -S . -B ./build && make -C ./build && ./build/learn_opengl<cr>", {})

u.map("n", "<leader>+", "<cmd>source $MYVIMRC<CR>", { desc = "Reload nvim config" })
