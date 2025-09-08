return {
  "nvim-neorg/neorg",
  dependencies = {
    { dir = "~/projects/neorg-gtd" },
    'nvim-neorg/lua-utils.nvim',
    'pysan3/pathlib.nvim',
    'nvim-neotest/nvim-nio',
    "benlubas/neorg-query"
  },
  lazy = false,
  version = "*",
  config = function()
    local norg = require("neorg")
    local u = require("core/utils")
    norg.setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.ui.calendar"] = {},
        ["core.summary"] = {},
        ["core.neorgcmd.commands.return"] = {},
        ["external.gtd"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              personal = "~/notes/personal",
            },
            default_workspace = "personal",
          },
        },
        -- default values
        ["external.query"] = {
          config = {
            -- Populate the database. Indexing happens on a separate thread, so doesn't block
            -- neovim. Funny enough, this is the only user facing way to trigger a full index of your
            -- workspace at the moment
            index_on_launch = true,

            -- Update the db entry when a file is written
            update_on_change = true,
          }
        }
      },
    })

    -- Idk conceal level thingy
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      pattern = { "*.norg" },
      command = "set conceallevel=3",
    })

    -- [[
    --    KEYS
    -- ]]

    -- General
    u.map("n", "<leader>oo", "<cmd>Neorg index<CR>", { desc = "[Neorg] - Go to index" })
    -- u.map("n", "<leader>og", "<cmd>Neorg index<CR>", { desc = "[Neorg] - Go to index" })

    -- Neorg-specific filetype keybinds
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "norg",
      callback = function()
        u.map("n", "<leader>or", "<cmd>Neorg return<CR>", { desc = "[Neorg] - Return" })
      end,
    })
  end,
}
