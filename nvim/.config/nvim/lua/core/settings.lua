vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.scrolloff = 10

if vim.fn.executable("python3") == 1 then
	vim.g.python3_host_prog = vim.fn.exepath("python3")
end
