local builtin = require("core.plugins").builtin

local set = vim.opt
local g = vim.g
local keymap = vim.keymap

g.mapleader = ","
g.maplocalleader = ","

vim.wo.number = true -- Set's the sidebar number

set.backspace = "2"
set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.autoread = true

set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true

keymap.set("n", "<leader>h", ":nohlsearch<ENTER>")

-- Setting telescope search files and live grep bindings
keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>g", builtin.live_grep, {})

