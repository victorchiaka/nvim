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
          "jdtls",
          "cssls",
          "tailwindcss",
          "emmet_ls",
          "emmet_language_server",
          "volar",
          "svelte",
          "astro",
          "pyright",
          "gopls",
          "prismals"
        },
        automatic_installation = true,
      })
    end,
  },
  -- utility plugin for configuring the java language server for us
  {
    "mfussenegger/nvim-jdtls",
    -- lazy = true,
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-dap",
    }
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

      -- Let's add vue support
      local mason_registry = require("mason-registry")
      local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path() ..
      "/node_modules/@vue/language-server"

      lspconfig["ts_ls"].setup({
        init_options = {
          -- Adds the vue language server path as a plugin
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server_path,
              languages = { "vue" }
            }
          }
        },
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

      lspconfig["astro"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["pyright"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["jdtls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["gopls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            staticcheck = true, -- Enable additional linters
          },
        },
      })

      lspconfig["prismals"].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })
    end,
  },

  -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      -- ensure the java debug adapter is installed
      require("mason-nvim-dap").setup({
        ensure_installed = { "java-debug-adapter", "java-test" }
      })
    end
  },

}
