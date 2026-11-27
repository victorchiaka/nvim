require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local o = vim.opt

o.clipboard = "unnamedplus"
o.termguicolors = true
o.numberwidth = 2
o.relativenumber = true
o.wrap = false
o.smartindent = true
o.breakindent = true
o.backspace = "2"
o.showcmd = true

o.expandtab = true
o.tabstop = 4
o.softtabstop = 2
o.shiftwidth = 4

o.writebackup = false
o.swapfile = false

o.updatetime = 500 -- ms before CursorHold fires (default is 4000)

o.cursorlineopt = "both"
