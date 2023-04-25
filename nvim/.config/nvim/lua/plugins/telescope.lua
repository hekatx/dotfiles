local telescope = require("telescope")

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "build",
      "CMakeFiles"
    },
  },
}


telescope.load_extension "file_browser"
