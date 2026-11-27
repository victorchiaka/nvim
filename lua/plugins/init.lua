return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = function(_, opts)
      local actions = require "telescope.actions"
      opts.defaults = opts.defaults or {}
      opts.defaults.sorting_strategy = "descending"
      opts.defaults.layout_config = vim.tbl_deep_extend("force", opts.defaults.layout_config or {}, {
        horizontal = {
          prompt_position = "bottom",
        },
      })
      opts.defaults.mappings = opts.defaults.mappings or {}
      opts.defaults.mappings.i = vim.tbl_deep_extend("force", opts.defaults.mappings.i or {}, {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      })
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      })
      return opts
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      telescope.load_extension "ui-select"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
      })
      return opts
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "sign_define.*deprecated" },
              { find = "vim%.fn%.sign_define.*deprecated" },
              { find = "vim%.lsp%.util%.make_position_params.*deprecated" },
              { find = "vim%.lsp%.util%.jump_to_location.*deprecated" },
              { find = "deprecated" },
            },
          },
          opts = { skip = true },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "rebelot/heirline.nvim",
    event = "BufReadPost",
    opts = function()
      local conditions = require "heirline.conditions"
      local utils = require "heirline.utils"

      local pill_bg = utils.get_highlight("StatusLine").bg or "#2a2e36"
      local normal_bg = utils.get_highlight("Normal").bg or "#1e222a"
      local fg = utils.get_highlight("Normal").fg or "#abb2bf"

      return {
        opts = {
          disable_winbar_cb = function(args)
            return conditions.buffer_matches({
              buftype = { "nofile", "prompt", "help", "quickfix" },
              filetype = { "^git.*", "neo-tree", "alpha", "TelescopePrompt" },
            }, args.buf)
          end,
        },
        winbar = {
          init = function(self)
            self.filename = vim.api.nvim_buf_get_name(0)
            local name = vim.fn.fnamemodify(self.filename, ":t")
            local ext = vim.fn.fnamemodify(self.filename, ":e")
            local icon, icon_hl = require("nvim-web-devicons").get_icon(name, ext, { default = true })
            self.icon = icon or ""
            self.icon_color = utils.get_highlight(icon_hl).fg or fg
          end,
          { provider = "", hl = { fg = pill_bg, bg = normal_bg } },
          {
            provider = function(self)
              return self.icon .. " "
            end,
            hl = function(self)
              return { fg = self.icon_color, bg = pill_bg }
            end,
          },
          {
            provider = function(self)
              local name = vim.fn.fnamemodify(self.filename, ":t")
              return name == "" and "[No Name]" or name
            end,
            hl = { fg = fg, bg = pill_bg },
          },
          {
            condition = function()
              return vim.bo.modified
            end,
            provider = " ●",
            hl = { fg = "green", bg = pill_bg },
          },
          {
            provider = " ",
            hl = { fg = fg, bg = pill_bg },
            on_click = {
              callback = function()
                vim.cmd "bdelete"
              end,
              name = "heirline_winbar_close",
            },
          },
          { provider = "", hl = { fg = pill_bg, bg = normal_bg } },
        },
      }
    end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require "alpha"

      -- local dashboard = require "alpha.themes.startify"
      local dashboard = require "alpha.themes.dashboard"

      dashboard.section.header.val = {
        [[                                                          ]],
        [[    ░█░█░▀█▀░█▀▀░▀█▀░█▀█░█▀▄░░░█▀▀░█░█░▀█▀░█▀█░█░█░█▀█    ]],
        [[    ░▀▄▀░░█░░█░░░░█░░█░█░█▀▄░░░█░░░█▀█░░█░░█▀█░█▀▄░█▀█    ]],
        [[    ░░▀░░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░░░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀░▀    ]],
        [[                                                          ]],
      }

      alpha.setup(dashboard.opts)
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
