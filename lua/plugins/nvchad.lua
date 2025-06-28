return {
  "nvim-lua/plenary.nvim",

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true
  },

  {
    "nvchad/base46",
    lazy = false,
    priority = 1000,
    config = function()
      -- require("base46").load_all_highlights()
      -- require("base46").load_highlight("statusline")
    end,
  },

  {
    "nvchad/ui",
    lazy = false,
    priority = 1000,
    config = function()
      require "nvchad"
    end
  },
}
