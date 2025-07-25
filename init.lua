require("keymaps")

local set = vim.opt

-- NVChad setup - put this BEFORE lazy setup
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- Load plugins
require("plugins_spec")

-- require("base46").load_all_highlights() -- To load all highlights, and the theme - NVChad's beautiful theme
-- dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")


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

vim.wo.number = true -- Set's the sidebar number
