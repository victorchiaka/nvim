return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },

    opts = {
        -- Stops blink from working on python files
        enabled = function()
            return vim.bo.filetype ~= "python"
        end,
        
        keymap = {
            preset = "none",
            ["<C-Space>"] = { "show", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
        completion = {
            menu = { border = "rounded" },
            documentation = {
                auto_show = true,
                window = { border = "rounded" },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
}
