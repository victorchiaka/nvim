return {
    cmd = { vim.fn.exepath("lua-language-server") },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
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
