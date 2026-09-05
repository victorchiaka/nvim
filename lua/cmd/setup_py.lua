-- Sets up ruff
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        if vim.fn.executable("ruff") == 0 then vim.fn.jobstart("pip install ruff", { detach = true }) end
    end,
})
