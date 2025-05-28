return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    })
    vim.diagnostic.config({
      virtual_text = false, -- Disable by default
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    local diagnostic_ns = vim.api.nvim_create_namespace("cursor_line_diagnostics")

    -- Set up autocommands for cursor movement
    vim.api.nvim_create_augroup("LineDiagnostics", { clear = true })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = "LineDiagnostics",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local line = vim.fn.line('.') - 1

        -- Clear only our diagnostic namespace
        vim.api.nvim_buf_clear_namespace(bufnr, diagnostic_ns, 0, -1)

        -- Get diagnostics for current line
        local line_diagnostics = vim.diagnostic.get(bufnr, { lnum = line })

        if #line_diagnostics > 0 then
          for _, diagnostic in ipairs(line_diagnostics) do
            local hl_group = "DiagnosticVirtualTextError" -- Default to error
            if diagnostic.severity == vim.diagnostic.severity.WARN then
              hl_group = "DiagnosticVirtualTextWarn"
            elseif diagnostic.severity == vim.diagnostic.severity.INFO then
              hl_group = "DiagnosticVirtualTextInfo"
            elseif diagnostic.severity == vim.diagnostic.severity.HINT then
              hl_group = "DiagnosticVirtualTextHint"
            end

            vim.api.nvim_buf_set_extmark(bufnr, diagnostic_ns, line, -1, {
              virt_text = { { "● " .. diagnostic.message, hl_group } },
              virt_text_pos = "eol"
            })
          end
        end
      end,
    })
    vim.keymap.set({ "n", "v" }, "<leader>v", vim.lsp.buf.format, {})
  end,
}
