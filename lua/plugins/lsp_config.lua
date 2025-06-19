return {
  {
    "williamboman/mason.nvim",
    -- Pin to January 2025 commit (last stable v1.x before v2.0.0 broke things)
    commit = "e2f7f9044ec30067bc11800a9e266664b88cda22", -- January 15, 2025
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "⚡︎",
            package_uninstalled = "✗",
          },
        },
        ensure_installed = {
          "eslint_d"
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- Pin to January 2025 commit (before Volar issues started)
    commit = "2451adb9bdb0fd32140bf3aa8dbc17ff60050735", -- January 20, 2025
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "tsserver",
          "jdtls",
          "cssls",
          "tailwindcss",
          "emmet_ls",
          "volar",
          "svelte",
          "astro",
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

        keymap.set("n", "K", buf.hover, opts)
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
        on_attach = on_attach,
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

      lspconfig["tsserver"].setup({
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
          "typescript",
          "javascript",
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

      lspconfig["svelte"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      lspconfig["astro"].setup({
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
