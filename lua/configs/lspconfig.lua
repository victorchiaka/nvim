require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "lua_ls",
  "emmet_ls",
  "ts_ls",
  "tailwindcss",
  "gopls",
  "svelte",
  "prismals",
  "vue_ls",
}
vim.lsp.enable(servers)

require "configs.diagnostics"

-- read :h vim.lsp.config for changing options of lsp servers 
