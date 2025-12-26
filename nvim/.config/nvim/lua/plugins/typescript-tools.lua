return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  lazy = false,
  opts = {
    tsserver_file_preferences = {
      autoImportFileExcludePatterns = {
        "**/node_modules/react-native/types/**"
      }
    }
  },
  keys = {
    { "gri",        "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "[TS-Tools] Go to definition" },
    { "<leader>mi", "<cmd>TSToolsAddMissingImports<cr>",    desc = "[TS-Tools] Add missing imports" }
  }
}
