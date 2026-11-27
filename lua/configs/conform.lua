local options = {
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    vue = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    liquid = { "prettierd" },
    lua = { "stylua" },
    go = { "goimports", "gofmt" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 200,
  },
}

return options
