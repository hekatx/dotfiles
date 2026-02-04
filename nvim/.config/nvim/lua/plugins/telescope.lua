return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "CMakeFiles",
        },
      },
    })
  end,
}
