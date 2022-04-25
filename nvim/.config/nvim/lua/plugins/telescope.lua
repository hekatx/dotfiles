local telescope = require("telescope")


telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    }
  },
  extensions = {
    file_browser = {
      initial_mode = "normal"
    }
  }
}

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

telescope.load_extension "file_browser"

