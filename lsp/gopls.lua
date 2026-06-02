return {
    cmd = { vim.fn.exepath("gopls") },
    filetypes = { "go", "gomod", "gowork" },
    root_markers = { "go.mod", "go.work", ".git" },
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        },
    },
}
