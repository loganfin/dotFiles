vim.opt.mouse = "a"

vim.opt.guicursor = ""

vim.opt.signcolumn = "yes"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8
vim.opt.wrap = false

vim.opt.showtabline = 2

vim.opt.colorcolumn = "80"

-- allow for flush zoom-in of splits
vim.opt.winminheight = 0

-- because status line displays current mode
vim.opt.showmode = false

vim.opt.swapfile = false

vim.opt.termguicolors = true

-- fix namespace indenting in c++
vim.opt.cino = "(gNN-s)"

-- turn off automatic comments
vim.opt.formatoptions = vim.opt.formatoptions - "c"
vim.opt.formatoptions = vim.opt.formatoptions - "r"
vim.opt.formatoptions = vim.opt.formatoptions - "0"
