return {
    cmd = { vim.fn.exepath("emmet-ls"), "--stdio" },
    filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
    },
    root_markers = { "package.json", ".git" },
}
