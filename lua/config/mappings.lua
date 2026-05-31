local g = vim.g
local buf = vim.lsp.buf
local map = vim.keymap.set

local opts = { noremap = true, silent = true }

local telescope = require("telescope.builtin")

map("n", "<leader>n", ":Neotree filesystem reveal<ENTER>", opts)
map("n", "<leader>dn", "<cmd>NoiceDismiss<ENTER>", { desc = "Dismiss Noice Message" })

map("n", "<leader>rn", buf.rename, {})
map("n", "<leader>ca", buf.code_action, { noremap = true, silent = true })

map("n", "<leader>f", telescope.find_files, {})
map("n", "<leader>g", telescope.live_grep, {})
map("n", "<leader>b", telescope.current_buffer_fuzzy_find, {})
map("n", "<leader>fb", telescope.buffers, {}) -- Find files in the buffer list

-- Remapping comments
map("n", "<leader>gcc", "gcc", { remap = true, desc = "Comment line" })
map("v", "<leader>gc", "gc", { remap = true, desc = "Comment selection" })
map("n", "<leader>gb", "gc", { remap = true, desc = "Block comment" })
map("v", "<leader>gb", "gc", { remap = true, desc = "Block comment selection" })

-- Resizing window
map("n", "<C-Up>", ":resize -2<CR>", { silent = true })
map("n", "<C-Down>", ":resize +2<CR>", { silent = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })
map("n", "<leader>we", "<C-w>=", { desc = "Window equal" })

-- Text move
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })

-- INSERT mode: Move line up/down (and stay in insert mode)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up", silent = true })

-- VISUAL mode (line-wise): Move selection up/down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- VISUAL BLOCK mode: Move selection up/down
map("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down", silent = true })
map("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up", silent = true })

-- VISUAL mode: Indent with Tab and unindent with Shift+Tab
map("v", "<Tab>", ">gv", { desc = "Indent selection", silent = true })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection", silent = true })

-- VISUAL BLOCK mode: Same for block selections
map("x", "<Tab>", ">gv", { desc = "Indent block", silent = true })
map("x", "<S-Tab>", "<gv", { desc = "Unindent block", silent = true })
