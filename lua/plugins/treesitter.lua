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
        "java",
        "vue",
        "css",
        "scss",
        "tsx",
        "json",
        "markdown",
        "markdown_inline",
        "bash",
        "vim",
        "cpp",
        "dart",
        "prisma",
      },
      filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "rescript",
        "xml",
        "php",
        "markdown",
        "astro",
        "glimmer",
        "handlebars",
        "hbs",
        "dart",
        "prisma",
      },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
      -- auto_install = true, -- To auto install parser for any language
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
