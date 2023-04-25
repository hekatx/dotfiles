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
      use("nvim-lua/plenary.nvim")
      use("neovim/nvim-lspconfig")
      use("nvim-treesitter/nvim-treesitter")
      use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
      use("jose-elias-alvarez/typescript.nvim")
      use("mattn/emmet-vim")
      use("williamboman/mason.nvim")
      use("williamboman/mason-lspconfig.nvim")
      use("ray-x/lsp_signature.nvim")
      use("simrat39/rust-tools.nvim")

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
      use("hrsh7th/cmp-nvim-lsp")
      use("rafamadriz/friendly-snippets")

      -- Colorschemes
      use({ "catppuccin/nvim", as = "catppuccin" })
      use("sainnhe/sonokai")
      use("shaunsingh/moonlight.nvim")
      use("mangeshrex/everblush.vim")
      use("olivercederborg/poimandres.nvim")

      -- DAP / Debugger
      use("mfussenegger/nvim-dap")
      use("leoluz/nvim-dap-go")
      use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
      use({ "theHamsta/nvim-dap-virtual-text" })

      -- Motions and useful commands
      use({
          "phaazon/hop.nvim",
          branch = "v1",
      })
      use("tpope/vim-surround")
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
          },
      })

      -- Misc
      use("lewis6991/impatient.nvim")
      use("kevinhwang91/nvim-bqf")
    end)
