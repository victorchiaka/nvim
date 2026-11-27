require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- General
map("n", "<leader>n", "<cmd>Neotree filesystem reveal<CR>", { desc = "Neotree reveal" })
map("n", "<leader>dn", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- LSP
map("n", "<leader>cpr", function()
  vim.lsp.document_color.color_presentation()
end, { desc = "LSP color presentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
map("n", "<leader>g", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>b", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current buffer" })
map("n", "<leader>B", "<cmd>Telescope buffers<CR>", { desc = "Telescope buffers" })

-- Formatting with conform
map({ "n", "v" }, "<leader>v", function()
  require("conform").format()
end, { desc = "Format with conform" })

-- Resizing windows
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Window resize up" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Window resize down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Window resize left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Window resize right" })
map("n", "<leader>we", "<C-w>=", { desc = "Window equal" })

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
map("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down", silent = true })
map("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up", silent = true })

-- Indent / unindent in visual & visual-block modes
map("v", "<Tab>", ">gv", { desc = "Indent selection", silent = true })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection", silent = true })
map("x", "<Tab>", ">gv", { desc = "Indent block", silent = true })
map("x", "<S-Tab>", "<gv", { desc = "Unindent block", silent = true })
