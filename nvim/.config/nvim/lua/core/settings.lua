local o = vim.o
local wo = vim.wo

wo.relativenumber = true
wo.number = true
wo.wrap = false

o.smartcase = true
o.ignorecase = true
o.hlsearch = false
o.swapfile = false
o.clipboard = "unnamedplus"
o.termguicolors = true

o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true
o.smartindent = true

o.scrolloff = 10

vim.g.python3_host_prog = "/usr/bin/python3"
