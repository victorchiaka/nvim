return {
    "https://github.com/victorchiaka/nvim-treesitter.git",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })
        treesitter.install({
            "c",
            "lua",
            "html",
            "javascript",
            "python",
            "typescript",
            "java",
            "vue",
            "css",
            "scss",
            "tsx",
            "json",
            "markdown",
            "markdown_inline",
            "bash",
            "svelte",
            "vim",
            "cpp",
            "dart",
            "prisma",
            "go",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "*" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
