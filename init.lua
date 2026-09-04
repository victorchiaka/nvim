local set = vim.opt
local g = vim.g

g.mapleader = ","
g.maplocalleader = ","

require("config.lazy")
require("config.mappings")
require("config.lsp")
require("config.coc")
require("config.treesitter")

vim.cmd.colorscheme("kanagawa")

set.clipboard = "unnamedplus"
set.termguicolors = true
set.numberwidth = 2
set.relativenumber = true
set.wrap = false
set.smartindent = true
set.breakindent = true
set.backspace = "2"
set.showcmd = true

set.expandtab = true
set.tabstop = 4
set.softtabstop = 2
set.shiftwidth = 4

set.writebackup = false
set.swapfile = false

set.updatetime = 500 -- ms before CursorHold fires (default is 4000)
