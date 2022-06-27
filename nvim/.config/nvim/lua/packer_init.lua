local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = false }
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lsp'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-surround'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use({ 'jose-elias-alvarez/null-ls.nvim', requires = { "nvim-lua/plenary.nvim" } })
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'honza/vim-snippets'
  use({'catppuccin/nvim', as = "catppuccin"})
  use 'shaunsingh/moonlight.nvim'
  use 'mangeshrex/everblush.vim'
  use 'sainnhe/sonokai'
  use { 'folke/tokyonight.nvim',  branch = 'main' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'feline-nvim/feline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use {
    'phaazon/hop.nvim',
    branch = 'v1' 
  }
  use { 'dstein64/vim-startuptime' }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
