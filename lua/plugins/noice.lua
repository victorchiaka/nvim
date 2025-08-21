return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        filter = {
          event = "msg_show",
          -- any = {
          --   { find = "sign_define.*deprecated" },
          --   { find = "vim%.fn%.sign_define.*deprecated" },
          --   { find = "vim%.lsp%.util%.make_position_params.*deprecated" }, -- Add this
          --   { find = "vim%.lsp%.util%.jump_to_location.*deprecated" }, -- Add this too
          --   { find = "deprecated" }, -- Or this more general one to catch all deprecation warnings
          -- },
        },
        opts = { skip = true },
      },
    },
    -- add any other options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- nvim-notify for those toast notification
    "rcarriga/nvim-notify",
  },
}
