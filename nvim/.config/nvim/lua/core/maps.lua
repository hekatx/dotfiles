vim.g.mapleader = " "
local api = vim.api

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>fd", "<cmd>Telescope buffers<cr>")

map("v", "<leader>p", "\"_dP")

vim.cmd("nmap ds       <Plug>Dsurround")
vim.cmd("nmap cs       <Plug>Csurround")
vim.cmd("nmap cS       <Plug>CSurround")
vim.cmd("nmap ys       <Plug>Ysurround")
vim.cmd("nmap yS       <Plug>YSurround")
vim.cmd("nmap yss      <Plug>Yssurround")
vim.cmd("nmap ySs      <Plug>YSsurround")
vim.cmd("nmap ySS      <Plug>YSsurround")
vim.cmd("xmap gs       <Plug>VSurround")
vim.cmd("xmap gS       <Plug>VgSurround")



