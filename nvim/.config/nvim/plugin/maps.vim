" Mappings
let mapleader = " "

" Telescope uwu
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

" Primeagen cool trick to paste what its in default register 
vnoremap <leader>p "_dP

" cpp stuff a.k.a.first try at makign neovim an IDE for cpp 
" CMake integration

nnoremap <leader>cg <cmd>CMakeGenerate<cr>
nnoremap <leader>cb <cmd>CMakeBuild<cr>
nnoremap <leader>\ <cmd>e ~/.config/nvim<cr>

" autocommands
autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.json :EslintFixAll
