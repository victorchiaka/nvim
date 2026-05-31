vim.lsp.enable({
    "lua_ls"
})

vim.diagnostic.config({
    -- virtual_text = {
    --     prefix = function(diagnostic)
    --         if diagnostic.severity == vim.diagnostic.severity.ERROR then return "󰅚" end
    --         if diagnostic.severity == vim.diagnostic.severity.WARN then return "󰀪" end
    --         if diagnostic.severity == vim.diagnostic.severity.HINT then return "󰌶" end
    --         if diagnostic.severity == vim.diagnostic.severity.INFO then return "󰋽" end
    --     end,
    -- },
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "󰋽",
        },
    },
    underline = true,
    update_in_insert = false,
    float = { border = "rounded" },
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focus = false,
            scope = "cursor",
            border = "rounded"
        })
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
