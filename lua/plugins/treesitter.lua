return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "c",
        "lua",
        "html",
        "javascript",
        "python",
        "typescript",
        "java"
      },
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

