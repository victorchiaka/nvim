return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup({
            theme = "auto",
            sections = {
                lualine_x = {
                    function()
                        return vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] and "TS" or ""
                    end,
                    "encoding", "filetype",
                },
            },
        })
    end
}
