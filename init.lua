require("keymaps")

-- NVChad setup - put this BEFORE lazy setup
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- Load plugins
require("plugins_spec")

-- require("base46").load_all_highlights() -- To load all highlights, and the theme - NVChad's beautiful theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Your other configurations...
require("jdtls")
require("autocmds")

-- Options
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.backup = false
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10

-- Tab and spacing
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.redrawtime = 10000
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.o.writebackup = false
vim.o.swapfile = false
