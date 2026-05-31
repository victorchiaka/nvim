return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "jvgrootveld/telescope-zoxide",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "nvim-tree/nvim-web-devicons",
    },

    opts = {
        -- extensions_list = { "themes", "terms", "zoxide" },
        extensions_list = { "themes", "terms" },
        extensions = {
            zoxide = {
                prompt_title = "[ Walking on the shoulders of TJ ]",
            },
        },
    }
}
