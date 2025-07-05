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
keymap.set("n", "<leader>b", builtin.current_buffer_fuzzy_find, {}) -- Current buffer fuzzy
keymap.set("n", "<leader>fb", builtin.buffers, {}) -- List files opened in the current buffer

keymap.set("n", "gd", builtin.lsp_definitions, opts) -- Go to definition
keymap.set("n", "gr", builtin.lsp_references, {}) -- Go to or shows all references
keymap.set("n", "gi", builtin.lsp_implementations, {}) -- Go to or shows all implementations
keymap.set("n", "gt", builtin.lsp_type_definitions, {}) -- Go to or shows all type defintions


-- Make resizing easier
keymap.set('n', '<C-Up>', ':resize -2<CR>', { silent = true })
keymap.set('n', '<C-Down>', ':resize +2<CR>', { silent = true })
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true })
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true })
keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Window equal' }) -- makes window equal


-- keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<ENTER>") -- Opens filesystem in left
keymap.set("n", "<leader>n", ":Neotree filesystem reveal right<ENTER>") -- Opens filesystem in right
keymap.set("n", "<leader>dn", "<cmd>NoiceDismiss<ENTER>", { desc = "Dismiss Noice Message" })

-- Nvim cmp shortcuts
keymap.set('n', '<C-k>', buf.signature_help, {})
keymap.set('n', '<leader>rn', buf.rename, {})

-- keymap.set('n', "<leader>v", buf.format, {}) -- Works with any formatter installed
