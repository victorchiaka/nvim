local g = vim.g
local buf = vim.lsp.buf
local keymap = vim.keymap

g.mapleader = ","
g.maplocalleader = ","

-- Nvim buffer / cmp actions
keymap.set("n", "<C-k>", buf.signature_help, {})
keymap.set("n", "<leader>rn", buf.rename, {})
keymap.set("n", "<leader>v", buf.format, {}) -- Works with any formatter installed

keymap.set("n", "K", buf.hover, { noremap = true, silent = true })
keymap.set("n", "<leader>ca", buf.code_action, { noremap = true, silent = true })
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { noremap = true, silent = true })

keymap.set("n", "<leader>h", ":nohlsearch<CR>")

local telescope = require("config.lazy").telescope

-- Search files & Live grep
keymap.set("n", "<leader>f", telescope.find_files, {})
keymap.set("n", "<leader>g", telescope.live_grep, {})
keymap.set("n", "<leader>b", telescope.current_buffer_fuzzy_find, {})
keymap.set("n", "<leader>fb", telescope.buffers, {})
-- Telescope lsp feature
keymap.set("n", "gd", telescope.lsp_definitions, {})
keymap.set("n", "gr", telescope.lsp_references, {})
keymap.set("n", "gi", telescope.lsp_implementations, {})
keymap.set("n", "gt", telescope.lsp_type_definitions, {})

keymap.set("n", "<leader>n", ":Neotree filesystem reveal right<ENTER>")
keymap.set("n", "<leader>dn", "<cmd>NoiceDismiss<ENTER>", { desc = "Dismiss Noice Message" })

-- Resizing window
keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Window equal" })

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
