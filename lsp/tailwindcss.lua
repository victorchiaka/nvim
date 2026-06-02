return {
    cmd = { vim.fn.exepath("tailwindcss-language-server"), "--stdio" },
    filetypes = {
        "html", "css", "scss",
        "javascript", "javascriptreact",
        "typescript", "typescriptreact",
        "vue",
    },
}
