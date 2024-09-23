return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "⚡︎",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "ts_ls",
          "cssls",
          "tailwindcss",
          "emmet_ls",
          "emmet_language_server",
          "volar",
          "vuels",
          "svelte",
          "astro",
          "pyright",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function()
      local lspconfig = require("lspconfig")

      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap

      local opts = { noremap = true, silent = true }
      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        local buf = vim.lsp.buf

        keymap.set("n", "gr", "<cmd>Telescope lsp_references<ENTER>", opts)
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<ENTER>", opts)
        keymap.set("n", "K", buf.hover, opts)
        keymap.set("n", "gt", buf.type_definition, opts)
        keymap.set("n", "<leader>ca", buf.code_action, opts)
        keymap.set("n", "<leader>rs", ":LspRestart<ENTER>", opts)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })

      lspconfig["ts_ls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["html"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["cssls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["tailwindcss"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["emmet_ls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
          "html",
          "typescriptreact",
          "javascriptreact",
          "css",
          "sass",
          "less",
          "svelte",
          "vue",
        },
      })

      lspconfig["emmet_language_server"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
          "html",
          "typescriptreact",
          "javascriptreact",
          "css",
          "sass",
          "less",
          "svelte",
          "vue",
        },
      })

      lspconfig["svelte"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["volar"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["astro"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["pyright"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["vuels"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },
}
