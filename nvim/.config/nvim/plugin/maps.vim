" Mappings
let mapleader = " "

" Telescope uwu
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fd <cmd>Telescope buffers<cr>

" Primeagen cool trick to paste what its in default register 
vnoremap <leader>p "_dP

" cpp stuff a.k.a.first try at makign neovim an IDE for cpp 
" CMake integration

nnoremap <leader>cg <cmd>CMakeGenerate<cr>
nnoremap <leader>cb <cmd>CMakeBuild<cr>
nnoremap <leader>\ <cmd>e ~/.config/nvim<cr>

" Maps to make lightspeed compatible with vim-surround
"
let g:surround_no_mappings = 1
nmap ds <Plug>Dsurround
nmap cs <Plug>Csurround
nmap cS <Plug>CSurround
nmap ys <Plug>Ysurround
nmap yS <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap gs <Plug>VSurround
xmap gS <Plug>VgSurround
