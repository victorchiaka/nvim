local cmd = vim.cmd
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local keymap = vim.keymap

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- local opts = {
--   ui = {
--     icons = vim.g.have_nerd_font and {} or {
--       cmd = "⌘",
--       config = "🛠",
--       event = "📅",
--       ft = "📂",
--       init = "⚙",
--       keys = "🗝",
--       plugin = "🔌",
--       runtime = "💻",
--       require = "🌙",
--       source = "📄",
--       start = "🚀",
--       task = "📌",
--       lazy = "💤 ",
--     },
--   },
-- }

local opts = {}

require("lazy").setup("plugins", opts)

local builtin = require("telescope.builtin")

-- From this section to setup vscode theme
-- cmd([[colorscheme vscode]])

-- From this section to setup solarized osaka theme
-- cmd([[colorscheme solarized-osaka]])

-- From this section to setup gruvbox theme
-- cmd([[colorscheme gruvbox]]) -- to set gruvbox theme
-- cmd([[colorscheme retrobox]]) -- to set retrobox theme

-- Define the theme first in M.base46.theme in chadrc.lua for uniformity
-- From this section to setup kanagawa theme
-- cmd("colorscheme kanagawa-lotus")
cmd("colorscheme kanagawa-wave") -- default same as cmd("colorscheme kanagawa")
-- cmd("colorscheme kanagawa-dragon")

-- From this section to setup one dark theme
-- require("onedark").load()

return {
  builtin = builtin,
} -- This returns should happen at the end of the file
