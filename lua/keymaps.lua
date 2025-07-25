local set = vim.opt
local g = vim.g
local keymap = vim.keymap
local buf = vim.lsp.buf

g.mapleader = ","
g.maplocalleader = ","

local builtin = require("plugins_spec").builtin

keymap.set("n", "<leader>h", ":nohlsearch<ENTER>")

-- Setting telescope search files and live grep bindings
keymap.set("n", "<leader>f", builtin.find_files, {})
keymap.set("n", "<leader>g", builtin.live_grep, {})
keymap.set("n", "<leader>b", builtin.current_buffer_fuzzy_find, {}) -- Current buffer fuzzy
keymap.set("n", "<leader>fb", builtin.buffers, {})                  -- List files opened in the current buffer

keymap.set("n", "gd", builtin.lsp_definitions, opts)                -- Go to definition
keymap.set("n", "gr", builtin.lsp_references, {})                   -- Go to or shows all references
keymap.set("n", "gi", builtin.lsp_implementations, {})              -- Go to or shows all implementations
keymap.set("n", "gt", builtin.lsp_type_definitions, {})             -- Go to or shows all type defintions


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

-- Text move
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
-- INSERT mode: Move line up/down (and stay in insert mode)
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up", silent = true })
-- VISUAL mode (line-wise): Move selection up/down
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
-- VISUAL BLOCK mode: Move selection up/down
keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down", silent = true })
keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up", silent = true })

-- VISUAL mode: Indent with Tab and unindent with Shift+Tab
keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection", silent = true })
keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent selection", silent = true })

-- VISUAL BLOCK mode: Same for block selections
keymap.set("x", "<Tab>", ">gv", { desc = "Indent block", silent = true })
keymap.set("x", "<S-Tab>", "<gv", { desc = "Unindent block", silent = true })
