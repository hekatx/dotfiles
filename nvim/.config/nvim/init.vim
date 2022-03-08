" Vim Plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lsp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'puremourning/vimspector', {'do': 'python3 install_gadget.py --enable-vscode-cpptools'}
Plug 'cdelledonne/vim-cmake'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
Plug 'ggandor/lightspeed.nvim'
Plug 'catppuccin/nvim'
Plug 'shaunsingh/moonlight.nvim'
Plug 'mangeshrex/uwu.vim'
Plug 'sainnhe/sonokai'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-neorg/neorg'
Plug 'nvim-neorg/neorg-telescope'
call plug#end()

" Colorscheme
" colorscheme catppuccin
" colorscheme moonlight
" let g:UwuNR=0 " default
" colorscheme uwu
" let g:sonokai_style = 'default'
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1
" 
" colorscheme sonokai
let g:tokyonight_style = "night"
colorscheme tokyonight

" Autocommands
autocmd FileType javascript,javascriptreact,typescript,typescriptreact
  \ UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact
