local map = vim.keymap.set

-- Miscellaneous
map("v", "<leader>p", '"_dP', { desc = "[Misc] Paste in place without losing the yanked stuff" })
map("n", "<leader>cb", "<cmd>! cmake -S . -B ./build && make -C ./build && ./build/learn_opengl<cr>", {
	desc = "Build and run LearnOpenGL",
})
map("n", "<leader>+", "<cmd>source $MYVIMRC<CR>", { desc = "Reload nvim config" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
