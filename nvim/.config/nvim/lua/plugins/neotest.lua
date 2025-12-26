return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "marilari88/neotest-vitest",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vitest"),
      }
    })
  end,
}
