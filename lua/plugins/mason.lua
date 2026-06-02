return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({ PATH = "prepend" })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "vue_ls", "tailwindcss", "ts_ls", "svelte" },
            })
        end,
    },
}
