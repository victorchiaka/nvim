local treesitter_config = require("core.plugins").treesitter_config


treesitter_config.setup({
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
});
