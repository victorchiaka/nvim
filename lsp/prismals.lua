return {
    cmd = { vim.fn.exepath("prisma-language-server"), "--stdio" },
    filetypes = { "prisma" },
    root_markers = { "package.json", ".git" },
}
