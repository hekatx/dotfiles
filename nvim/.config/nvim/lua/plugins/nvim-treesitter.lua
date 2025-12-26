return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    sync_install = false,
    autotag = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    ensure_installed = {
      "tsx",
      "html",
      "css",
      "typescript",
      "javascript",
      "json",
      "yaml",
      "go",
      "cpp",
      "lua",
      "rust",
      "markdown",
    },
    ignore_install = {},
    modules = {},
  }
}
