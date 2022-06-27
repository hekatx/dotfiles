local telescope = require("telescope")

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    },
  },
}


vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

telescope.load_extension "file_browser"

