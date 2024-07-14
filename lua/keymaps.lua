local set = vim.opt
local g = vim.g
local keymap = vim.keymap
local buf = vim.lsp.buf

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
keymap.set("n", "<leader>dn", "<cmd>NoiceDismiss<ENTER>", { desc = "Dismiss Noice Message" })

-- Nvim cmp shortcuts
keymap.set('n', 'gd', buf.definition, opts)
keymap.set('n', '<C-k>', buf.signature_help, {})
keymap.set('n', 'gi', buf.implementation, {})
keymap.set('n', '<leader>rn', buf.rename, {})

-- keymap.set('n', "<leader>v", buf.format, {}) -- Works with any formatter installed
