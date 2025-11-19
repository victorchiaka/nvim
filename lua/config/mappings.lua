local g = vim.g
local buf = vim.lsp.buf
local map = vim.keymap.set

g.mapleader = ","
g.maplocalleader = ","

local conform = require("config.lazy").conform
local telescope = require("config.lazy").telescope

local opts = { noremap = true, silent = true }

-- Conform >> Formatting
map({ "n", "v" }, "<leader>v", conform.format, { noremap = true, silent = true })

-- Nvim buffer / cmp actions
map("n", "<C-k>", buf.signature_help, {})
map("n", "<leader>rn", buf.rename, {})

map("n", "K", buf.hover, { noremap = true, silent = true })
map("n", "<leader>ca", buf.code_action, { noremap = true, silent = true })
map("n", "<leader>rs", ":LspRestart<CR>", { noremap = true, silent = true })

map("n", "<leader>h", ":nohlsearch<CR>")

map("n", "<leader>n", ":Neotree filesystem reveal right<ENTER>", { noremap = true, silent = true })
map("n", "<leader>dn", "<cmd>NoiceDismiss<ENTER>", { desc = "Dismiss Noice Message" })

-- Search files & Live grep
map("n", "<leader>f", telescope.find_files, {})
map("n", "<leader>g", telescope.live_grep, {})
map("n", "<leader>b", telescope.current_buffer_fuzzy_find, {})
map("n", "<leader>fb", telescope.buffers, {})

-- Telescope lsp feature
map("n", "gd", telescope.lsp_definitions, {})
map("n", "gr", telescope.lsp_references, {})
map("n", "gi", telescope.lsp_implementations, {})
map("n", "gt", telescope.lsp_type_definitions, {})

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

-- GIT Bidings
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Opens lazy git window", silent = true })
map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[G]it Preview [H]unk", silent = true })
-- Set a vim motion to <leader> + g + b to view the most recent contributers to the file
map("n", "<leader>lb", ":Git blame<CR>", { desc = "[G]it [B]lame", silent = true })
-- Set a vim motion to <leader> + g + <Shift>A to all files changed to the staging area
map("n", "<leader>gA", ":Git add .<CR>", { desc = "[G]it Add [A]ll", silent = true })

-- BufferLine
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Move to specific buffer positions
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

-- ======= BUFFERLINE =======
-- ===========================
-- Buffer Closing
-- ===========================
map("n", "<leader>x", ":bdelete<CR>", opts) -- Close current buffer
map("n", "<leader>X", ":bdelete!<CR>", opts) -- Close current buffer (force)
map("n", "<leader>bx", ":%bdelete<CR>", opts) -- Close all buffers
map("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opts) -- Close all buffers except current

map("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts) -- Close all buffers to the left
map("n", "<leader>br", ":BufferLineCloseRight<CR>", opts) -- Close all buffers to the right

-- ===========================
-- Buffer Sorting
-- ===========================
map("n", "<leader>bse", ":BufferLineSortByExtension<CR>", opts) -- Sort buffers by extension
map("n", "<leader>bsd", ":BufferLineSortByDirectory<CR>", opts) -- Sort buffers by directory
map("n", "<leader>bst", ":BufferLineSortByTabs<CR>", opts) -- Sort buffers by tabs

-- ===========================
-- Buffer Reordering
-- ===========================
map("n", "<leader>mr", ":BufferLineMoveNext<CR>", opts) -- Move current buffer to the right
map("n", "<leader>ml", ":BufferLineMovePrev<CR>", opts) -- Move current buffer to the left
