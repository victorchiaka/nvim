return {
    cmd = { vim.fn.exepath("lua-language-server") },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library",
                    vim.fn.stdpath("config")
                }
            },
            telemetry = { enable = false },
            completion = {
                callSnippet = "Replace", -- shows full function signatures
            },
        }
    }
}
