vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("config.mappings")
require("config.lazy")

-- Loads nvui as PDE starts
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end

local set = vim.opt

-- vim.cmd("colorscheme solarized-osaka")

-- Options
set.clipboard = "unnamedplus"
set.termguicolors = true
set.backup = false
set.numberwidth = 2
set.signcolumn = "yes"
set.wrap = false
set.scrolloff = 10
set.relativenumber = true

-- Tab and spacing
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.redrawtime = 10000
set.shiftwidth = 2
set.smartindent = true
set.breakindent = true
vim.o.writebackup = false
vim.o.swapfile = false

set.backspace = "2"
set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.autoread = true

set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true

vim.wo.number = true -- Set's sidebar numbers
