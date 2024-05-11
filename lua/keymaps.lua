local set = vim.opt
local g = vim.g
local keymap = vim.keymap

g.mapleader = ","
g.maplocalleader = ","

local builtin = require("plugins_spec").builtin

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

keymap.set("n", "<leader>h", ":nohlsearch<ENTER>")

-- Setting telescope search files and live grep bindings
keymap.set("n", "<leader>f", builtin.find_files, {})
keymap.set("n", "<leader>g", builtin.live_grep, {})
keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<ENTER>")
