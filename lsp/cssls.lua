return {
    cmd = { vim.fn.exepath("vscode-css-language-server"), "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { "package.json", ".git" },
}
