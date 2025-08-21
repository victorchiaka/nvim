return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        ensure_installed = {
          "eslint_d",
          "stylua",
        },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "ts_ls",
          "vue_ls",
          "cssls",
          "tailwindcss",
          "emmet_ls",
          "gopls",
          "prismals",
        },
        automatic_installation = true,
      })

      local signs = {
        Error = "✘",
        Warn = "▲",
        Hint = "⚑",
        Info = "»",
      }

      -- Set up diagnostic signs (works with current Neovim versions)
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Setup servers with blink.cmp capabilities
      local servers = {
        lua_ls = {},
        html = {},
        ts_ls = {},
        cssls = {},
        tailwindcss = {},
        emmet_ls = {},
        gopls = {},
        prismals = {},
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      -- Custom keymap to match your nvim-cmp bindings
      keymap = {
        preset = "none",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<CR>"] = { "accept", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      -- Auto-trigger completion (similar to your nvim-cmp config)
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 100 },
        trigger = {
          prefetch_on_insert = true,
          show_on_insert_on_trigger_character = true,
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
