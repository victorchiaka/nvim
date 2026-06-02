return {
    cmd = { vim.fn.exepath("vscode-html-language-server"), "--stdio" },
    filetypes = { "html" },
    root_markers = { "package.json", ".git" },
}
