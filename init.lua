require("keymaps")
require("plugins_spec")
require("jdtls")
require("autocmds")

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.backup = false

vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"

vim.opt.wrap = false -- to display in a single line
vim.opt.scrolloff = 10 -- number of line to keep above/below cursor

-- Tab and spacing
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.breakindent = true


vim.o.writebackup = false
vim.o.swapfile = false
