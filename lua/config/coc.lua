vim.g.coc_global_extensions = { "coc-pyright" }

local function check_back_space()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

_G.check_back_space = check_back_space

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function(ev)
        -- Disable Neovim 0.12+ built-in completion for Python
        vim.b[ev.buf].autocomplete = false
        pcall(function()
            vim.bo[ev.buf].autocomplete = false
        end)
        vim.bo[ev.buf].omnifunc = ""
        vim.bo[ev.buf].completefunc = ""

        local keyset = vim.keymap.set
        local bufopts = { buffer = ev.buf, silent = true }
        local expr_bufopts = { buffer = ev.buf, silent = true, expr = true, replace_keycodes = false }

        -- Buffer-local insert mode completion bindings for coc
        keyset("i", "<TAB>",
            [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "\<Tab>" : coc#refresh()]], expr_bufopts)
        keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], expr_bufopts)
        keyset("i", "<C-j>", [[coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"]], expr_bufopts)
        keyset("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"]], expr_bufopts)
        keyset("i", "<CR>",
            [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], expr_bufopts)

        -- Buffer-local LSP / navigation keymaps for coc
        keyset("n", "gd", "<Plug>(coc-definition)", bufopts)
        keyset("n", "gy", "<Plug>(coc-type-definition)", bufopts)
        keyset("n", "gi", "<Plug>(coc-implementation)", bufopts)
        keyset("n", "gr", "<Plug>(coc-references)", bufopts)
        keyset("n", "K", "<Cmd>call CocActionAsync('doHover')<CR>", bufopts)
        keyset("n", "<leader>rn", "<Plug>(coc-rename)", bufopts)
        keyset("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", bufopts)
        keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", bufopts)
        keyset("n", "]g", "<Plug>(coc-diagnostic-next)", bufopts)
    end,
})
