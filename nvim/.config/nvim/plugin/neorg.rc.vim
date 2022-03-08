lua << EOF
require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<Space>o"
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          main_workspace = "~/writing"
        }
      }
    },
    ["core.integrations.telescope"] = {}
  }
}
EOF
