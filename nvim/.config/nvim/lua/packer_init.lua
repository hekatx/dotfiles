local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
      fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function(use)
      -- Autoupdate packer
      use({ "wbthomason/packer.nvim", opt = false })
      if packer_bootstrap then
        require("packer").sync()
      end

      -- Lsp related plugins
      use({ "nvim-lua/plenary.nvim", tag = "v0.1.3", lock = true })
      use("neovim/nvim-lspconfig")
      use("nvim-treesitter/nvim-treesitter")
      use("jose-elias-alvarez/typescript.nvim")
      use("williamboman/mason.nvim")
      use("williamboman/mason-lspconfig.nvim")
      use("mfussenegger/nvim-lint")
      use({ "mhartington/formatter.nvim" })

      -- Telescope
      use("nvim-telescope/telescope.nvim")
      use("nvim-telescope/telescope-file-browser.nvim")
      use("kyazdani42/nvim-web-devicons")

      -- Completion engine + snippets
      use({ "hrsh7th/nvim-cmp", requires = { "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lua" } })
      use("hrsh7th/cmp-path")
      use("hrsh7th/cmp-nvim-lsp")
      use({
          "L3MON4D3/LuaSnip",
          -- install jsregexp (optional!:).
          run = "make install_jsregexp",
      })
      use("saadparwaiz1/cmp_luasnip")
      use("rafamadriz/friendly-snippets")

      -- Coq?
      use({ "ms-jpq/coq_nvim", branch = "coq" })

      -- Colorschemes
      use("olivercederborg/poimandres.nvim")

      -- DAP / Debugger
      use("mfussenegger/nvim-dap")
      use("leoluz/nvim-dap-go")
      use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
      use({ "theHamsta/nvim-dap-virtual-text" })
      use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }

      -- Motions and useful commands
      use({
          "phaazon/hop.nvim",
          branch = "v1",
      })
      use({
          "kylechui/nvim-surround",
          tag = "*", -- Use for stability; omit to use `main` branch for the latest features
          config = function()
              require("nvim-surround").setup()
          end
      })
      use("windwp/nvim-ts-autotag")
      use("tpope/vim-abolish")
      use({
          "nvim-neotest/neotest",
          requires = {
              "nvim-lua/plenary.nvim",
              "nvim-treesitter/nvim-treesitter",
              "antoinemadec/FixCursorHold.nvim",
              "nvim-neotest/neotest-go",
              "haydenmeade/neotest-jest",
              "marilari88/neotest-vitest",
          },
      })

      -- Misc
     use({ "xiyaowong/transparent.nvim", config = function() require("transparent").setup({}) end })
      use("lewis6991/impatient.nvim")
      use("kevinhwang91/nvim-bqf")
      use {
        'codethread/qmk.nvim',
        config = function()
            local conf = {
                name = 'MIRYOKU_MAPPING',
                auto_format_pattern = 'custom_config.h',
                layout = {
                    '_ x x x x x x _ x x x x x x',
                    '_ x x x x x x _ x x x x x x',
                    '_ x x x x x x _ x x x x x x',
                    '_ _ _ _ x x x _ x x x _ _ _',
                }
            }
            require('qmk').setup(conf)
      end}
    end)
