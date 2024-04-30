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

local plugins = {
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
}

local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
local treesitter_config = require("nvim-treesitter.configs")

cmd([[colorscheme gruvbox]])

return {
  builtin = builtin,
  treesitter_config = treesitter_config
} -- This returns should happen at the end of the file
