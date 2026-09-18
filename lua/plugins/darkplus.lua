return {
    "victorchiaka/darkplus.nvim",
    version = "*", -- Optional: use latest stable release
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme darkplus")
    end,
}
