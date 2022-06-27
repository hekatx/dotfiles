require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "html",
    "scss",
    "typescript",
    "javascript",
    "json",
    "yaml",
    "cpp",
    "go",
  }
}
