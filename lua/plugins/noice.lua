return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        routes = {
            {
                filter = {
                    event = "msg_show",
                    any = {
                      { find = "sign_define.*deprecated" },
                      { find = "vim%.fn%.sign_define.*deprecated" },
                      { find = "vim%.lsp%.util%.make_position_params.*deprecated" },
                      { find = "vim%.lsp%.util%.jump_to_location.*deprecated" },
                      { find = "deprecated" },
                    },
                },
                opts = { skip = true },
            },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
