require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.api.nvim_set_keymap('', '<leader>h', "<cmd>lua require'hop'.hint_words()<cr>", {})
