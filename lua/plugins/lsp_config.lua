local keymap = vim.keymap
local buf = vim.lsp.buf -- To set lsp buffers

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "pyright",
          "svelte",
          "volar",
          "astro",
          -- "java_language_server",
          -- "gopls",
          "cssls",
          "html",
          "markdown_oxide",
          "prismals",
          "somesass_ls",
          "taplo",
          "tailwindcss",
          "yamlls"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.pyright.setup({})
      lspconfig.svelte.setup({})
      lspconfig.volar.setup({})
      lspconfig.astro.setup({})
      -- lspconfig.java_language_server.setup({})
      -- lspconfig.gopls.setup({})
      lspconfig.cssls.setup({})
      lspconfig.html.setup({})
      lspconfig.markdown_oxide.setup({}) -- For markdown
      lspconfig.prismals.setup({}) -- For prisma ORM
      lspconfig.somesass_ls.setup({})
      lspconfig.taplo.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.yamlls.setup({})

      -- Lsp buffer keybinding
      keymap.set("n", "K", buf.hover, {}) -- K = SHIFT+k
      keymap.set("n", "gd", buf.definition, {}) -- Go to definition
      keymap.set("n", "<leader>ca", buf.code_action, {})
     end
  }
}
